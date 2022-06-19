//import 'dart:html';

import 'dart:math';

import 'package:VWallet/account/login.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:VWallet/scaning_screens/loyalty_scanner.dart';
import 'package:VWallet/data/loyalty_doc_data.dart';
//import 'package:VWallet/data/test_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode/barcode.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';

import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:fialogs/fialogs.dart';
//import 'package:provider/provider.dart';
//import 'package:proste_dialog/proste_dialog.dart';
//import 'package:flutter_beautiful_popup/main.dart';
import 'package:VWallet/scaning_screens/update_loyalty_scanner.dart';

final listKey = GlobalKey<AnimatedListState>();
int size = documentNumber.length;
int size1 = cardHolder.length;
int size2 = createdDate.length;
dynamic? index2;

PanelController _pc = new PanelController();
BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class loyalty_doc_list extends StatefulWidget {
  loyalty_doc_list({Key? key}) : super(key: key);

  @override
  State<loyalty_doc_list> createState() => _loyalty_doc_listState();
}

class _loyalty_doc_listState extends State<loyalty_doc_list> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Color(0xFFEFEFEF),
          title: Text(
            "Loyalty",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF809EDC),
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              HapticFeedback.heavyImpact();
              //clear();
              // update_noClear();
              //delete_lists();
              update_test2();

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
                    HapticFeedback.heavyImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => qr_barcode_scanner()),
                    );
                  },
                  child: Icon(
                    Ionicons.add_circle_outline,
                    size: 30.0,
                    color: Color(0xFF809EDC),
                  ),
                )),
            /*Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    clear();
                    delete_lists();
                  },
                  child: Icon(
                    Ionicons.trash_bin_outline,
                    size: 30.0,
                    color: Colors.red,
                  ),
                )),*/
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
                Container(
                  child: IconButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      _pc.close();
                    },
                    icon: Icon(
                      Ionicons.chevron_down_outline,
                      color: Color(0xFF809EDC),
                    ),
                  ),
                ),
                SizedBox(width: 45),
                Text(
                  "Scan The Code",
                  style: TextStyle(
                    color: Color(0xFF809EDC),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          renderPanelSheet: false,
          //margin: EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0),
          maxHeight: 300,
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

  delete_item(int index) {
    /* String val = documentNumber[index];
    String val2 = cardHolder[index];
    String val3 = createdDate[index];
    if (val == val) {
      documentNumber.remove(val);
      cardHolder.remove(val2);
      createdDate.remove(val3);
    }*/

    final removeItem = documentNumber[index];
    final removeItem1 = cardHolder[index];
    final removeItem2 = createdDate[index];
    documentNumber.removeAt(index);
    cardHolder.removeAt(index);
    createdDate.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) =>
          buildItem(removeItem, removeItem1, removeItem2, index, animation),
    );
    update_test2();

    /*AnimatedListRemovedItemBuilder builder = (context, animation) {
      return buildItem(removeNum, removeName, removeDate, index, animation);
    };
    listKey.currentState?.removeItem(index, builder);*/
  }

  generate_code(int? index) {
    print('index in: $index');
    String item = '1234';
    if (index != null) {
      item = documentNumber[index];
      // print(documentNumber[index]);

    } else if (index == null) {
      print('index is Null');
    } else if (documentNumber.isEmpty) {
      dynamic? index = null;
    }
    return BarcodeWidget(
      barcode: Barcode.itf(zeroPrepend: true),
      data: item,
      width: 300,
      height: 100,
    );
  }

  Widget contentListView() {
    return AnimatedList(
      key: listKey,
      /*onReorder: (int oldIndex, int newIndex) {
        setState(() {
          final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
          final list = documentNumber.removeAt(oldIndex);
          final list2 = cardHolder.removeAt(oldIndex);
          final list3 = createdDate.removeAt(oldIndex);
          documentNumber.insert(index, list);
          cardHolder.insert(index, list2);
          createdDate.insert(index, list3);
        });
      },*/
      initialItemCount: documentNumber.length,
      itemBuilder: (context, index, animation) => buildItem(
          documentNumber[index],
          cardHolder[index],
          createdDate[index],
          index,
          animation),
    );
  }

  Widget buildItem(
      String doc, String name, String date, int index, dynamic animation) {
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
              elevation: 0,
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
                          validate_docNum(index) ?? '',
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
                          'Added Date: $date',
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
                          'Card Holder: $name',
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
                                delete_item(index);
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
                    /* Positioned(
                        left: 195,
                        bottom: 38,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 18,
                            color: Colors.grey.shade500,
                          ),
                        )),*/
                    Positioned(
                      left: 142.3,
                      top: 33.8,
                      child: ButtonTheme(
                        minWidth: 85.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: Color(0xFF6982B4),
                          elevation: 0,
                          onPressed: () {
                            //Feedback.forTap(context);
                            String value;
                            HapticFeedback.heavyImpact();
                            setState(() {
                              currentIndex = index;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      update_qr_barcode_scanner()),
                            );

                            //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(10))),
                          padding: EdgeInsets.only(right: 18),
                          child: Text(
                            "update",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            //Feedback.forTap(context);

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
                              fontSize: 17,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
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
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey.shade400,
              ),
            ]),
        margin: const EdgeInsets.all(24.0),
        //child: Center(child: Text("Test Content"),),
        child: Stack(children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 90.0, right: 0.0, bottom: 0.0),
            ),
            generate_code(index2),
          ]),
        ]),
      ),
    );
  }
}
