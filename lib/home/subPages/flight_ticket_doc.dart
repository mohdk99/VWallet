//import 'dart:html';

import 'dart:math';

import 'package:VWallet/account/login.dart';
import 'package:VWallet/data/flight_ticket/flight_ticket_data.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:VWallet/scaning_screens/flight_ticket_scanner.dart';
//import 'package:VWallet/data/loyalty_doc_data.dart';
//import 'package:VWallet/data/test_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode/barcode.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:VWallet/scaning_screens/flight_ticket_scanner.dart';
import 'package:flutter/services.dart';
import 'package:VWallet/data/flight_ticket/ticket_widget.dart';

final listKey = GlobalKey<AnimatedListState>();
generate_code(int index) {
  print('index: $index');
  String item = '1234';
  if (index != null) {
    item = flight_record_access.get(keysList[index])!.ticketCode!;
    // print(documentNumber[index]);

  } else if (index == null) {
    print('index is Null');
  } else if (flight_record_access.get(keysList[index])!.ticketCode == null) {
    dynamic? index = null;
  }
  return BarcodeWidget(
    barcode: Barcode.pdf417(),
    data: item,
    width: 300,
    height: 100,
  );
}

dynamic? index2;

PanelController _pc = new PanelController();
BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class flightTicket_doc_list extends StatefulWidget {
  flightTicket_doc_list({Key? key}) : super(key: key);

  @override
  State<flightTicket_doc_list> createState() => _flightTicket_doc_listState();
}

class _flightTicket_doc_listState extends State<flightTicket_doc_list> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Color(0xFFEFEFEF),
          title: Text(
            "Flight Ticket",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF809EDC),
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              //clear();
              // update_noClear();
              //delete_lists();

              Navigator.pop(context);
            },
            child: Icon(
              Ionicons.chevron_back_outline,
              size: 30.0,
              color: Color(0xFF809EDC),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => flight_ticket_scanner()),
                    );
                  },
                  child: Icon(
                    Ionicons.add_circle_outline,
                    size: 30.0,
                    color: Color(0xFF809EDC),
                  ),
                )),
          ],
        ),
        body: SlidingUpPanel(
          isDraggable: true,
          header: Container(
            width: 364,
            margin:
                EdgeInsets.only(left: 34.0, top: 35.0, right: 0.0, bottom: 0.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 45),
              ],
            ),
          ),
          renderPanelSheet: false,
          //margin: EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0),
          maxHeight: 521,
          minHeight: 0,
          slideDirection: SlideDirection.UP,
          panel: useDoc(),
          collapsed: Container(
            decoration: BoxDecoration(color: Colors.blue, borderRadius: radius),
          ),
          controller: _pc,
          borderRadius: radius,
          body: contentListView(),
        ),
      ),
    );
  }

  listview() {
    setState(() {
      contentListView();
    });
  }

  delete_item(int key, int index) async {
    /* String val = documentNumber[index];
    String val2 = cardHolder[index];
    String val3 = createdDate[index];
    if (val == val) {
      documentNumber.remove(val);
      cardHolder.remove(val2);
      createdDate.remove(val3);
    }*/

    listKey.currentState?.removeItem(
      index,
      (context, animation) => buildItem(
          flight_record_access.get(keysList)?.airline,
          flight_record_access.get(keysList)?.firstName,
          flight_record_access.get(keysList)?.lastName,
          flight_record_access.get(keysList)?.createdDate,
          flight_record_access.get(keysList)?.dep,
          flight_record_access.get(keysList)?.dis,
          index,
          animation),
    );

    print('index at detete $index with key $key');
    await flight_record_access.deleteAt(index);

    /*AnimatedListRemovedItemBuilder builder = (context, animation) {
      return buildItem(removeNum, removeName, removeDate, index, animation);
    };
    listKey.currentState?.removeItem(index, builder);*/
  }

  Widget contentListView() {
    return ValueListenableBuilder(
        valueListenable: flight_record_access.listenable(),
        builder: (context, Box<FlightTicket> box, _) {
          List<int> keys =
              flight_record_access.keys.cast<int>().toList(); // list of Keys
          keysList = keys; // Globalizing the list
          return AnimatedList(
              key: listKey,
              initialItemCount: keys.length, // Lingth of List View
              itemBuilder: (context, index, animation) {
                print('insert index at: $index');
                int key = keys[index]; // Get key at specific index position
                final FlightTicket? getFlight = flight_record_access
                    .get(key); // Access data with a key value
                return buildItem(
                    getFlight?.airline,
                    getFlight?.firstName,
                    getFlight?.lastName,
                    getFlight?.createdDate,
                    getFlight?.dep,
                    getFlight?.dis,
                    index,
                    animation);
              });
        });
  }

  Widget buildItem(String? doc, String? fname, String? lname, String? date,
      String? dep, String? dis, int index, dynamic animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              margin: EdgeInsets.fromLTRB(80, 20, 30, 0),
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          validate_flight(index) ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF809EDC),
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'From $dep to $dis',
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Passenger: $fname $lname',
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        left: 220,
                        bottom: 38,
                        child: IconButton(
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                            confirmationDialog(
                              context,
                              "Delete Item",
                              "Are you sure you want to delete this document?",
                              positiveButtonText: "Yes",
                              positiveButtonAction: () {
                                final int key = keysList[index];
                                delete_item(key, index);
                              },
                              negativeButtonText: "No",
                              negativeButtonAction: () {},
                              neutralButtonText: "OK",
                              neutralButtonAction: () {},
                              hideNeutralButton: true,
                              closeOnBackPress: false,
                              confirmationDialog: false,
                              confirmationMessage:
                                  "Please select this check box for confirmation",
                            );
                          },
                          icon: Icon(
                            Ionicons.close_circle_outline,
                            size: 18,
                            color: Colors.red,
                          ),
                        )),
                    Positioned(
                      left: 201.3,
                      top: 33.8,
                      child: ButtonTheme(
                        minWidth: 60.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: Color(0xFF809EDC),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                            setState(() {
                              index2 = index;
                            });
                            print('index: $index');
                            _pc.open();
                            //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(10))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "use",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 32,
              left: 30,
              child: Container(
                height: 55,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage(validate_image(index) ??
                        "assets/images/loyalty defualt.png"),
                    scale: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(-2, 0), // changes position of shadow
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget useDoc() {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: Colors.grey.shade300,
                ),
              ]),
          margin: const EdgeInsets.all(24.0),
          //child: Center(child: Text("Test Content"),),

          child: TicketWidget(
            width: 350,
            height: 500,
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
            child: TicketData(),
          ),

          //child: Center(child: Text("Test Content"),),
        ),
      ),
    );
  }
}

String dis = 'dis';

class TicketData extends StatefulWidget {
  TicketData({Key? key}) : super(key: key);

  @override
  State<TicketData> createState() => _TicketDataState();
}

class _TicketDataState extends State<TicketData> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: Center(
                child: Text(
                  '${validate_class(index2)}',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  validate_dep(index2),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.flight_takeoff,
                    color: Color(0xFF809EDC),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    validate_dis(index2),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Flight Ticket',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 17.0),
                child: ticketDetailsWidget(
                    'Passenger',
                    '${validate_firstName(index2)} ${validate_lastName(index2)}',
                    'Date',
                    validate_date(index2)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 29.0),
                child: ticketDetailsWidget(
                    'Flight',
                    validate_flightNumber(index2),
                    'Airline',
                    validate_airline(index2)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: ticketDetailsWidget('Class', validate_bClass(index2),
                    'Seat', validate_seat(index2)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          child: Container(
            width: 300.0,
            height: 100.0,
            /*decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/barcode.png'),
                    fit: BoxFit.cover)),*/
            child: generate_code(index2),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 125.0),
          child: IconButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              _pc.close();
            },
            icon: Icon(
              Ionicons.chevron_down_outline,
              color: Color(0xFF809EDC),
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
