import 'package:VWallet/data/id_card/id_card_data.dart';
import 'package:VWallet/home/subPages/license_doc.dart';
import 'package:VWallet/test.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data.dart';
import 'package:VWallet/account/login.dart';
import 'subPages/loyalty_doc.dart';
import 'package:VWallet/data/loyalty_doc_data.dart';
import 'package:VWallet/home/subPages/id_card_doc.dart';
import 'package:VWallet/scaning_screens/id_card_scnning/camera_page.dart';
import 'package:VWallet/scaning_screens/license_scanner/license_scanner.dart';
import 'package:VWallet/home/subPages/flight_ticket_doc.dart';

update() {
  String? entertainment;
  setState() {
    entertainment = documentNumber.length.toString();
  }

  return entertainment;
}

class eDocPage extends StatefulWidget {
  eDocPage({Key? key}) : super(key: key);

  @override
  State<eDocPage> createState() => _eDocPageState();
}

class _eDocPageState extends State<eDocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                      height: 35,
                      //width: 160,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: double.infinity),
                        margin: EdgeInsets.only(
                            left: 45.0, top: 11.0, right: 0.0, bottom: 0.0),
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'Welcome Mohamed!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6982B4),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/star1.png"),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF809EDC),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xFF809EDC), width: 2),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 130),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Color(0xFF809EDC),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => loginPage()));
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.red[400],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Container(
              height: 87,
              //width: 1000,
              child: ListView(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                children: [
                  // SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/jes-approval-2.jpg"),
                              scale: 16,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/GUtech_logo.png"),
                              scale: 9,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/shukran-logo-flat-english-01-1561084685.png"),
                              scale: 15,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/carrefour-2019-logo-ar-and-en-arabiccoupon-400x400.jpg"),
                              scale: 8,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/alMoujlogo.png"),
                              scale: 80,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/pngwing.com (1).png"),
                              scale: 30,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/978c322d636111686245c36a0abe47c8.jpg"),
                              scale: 10,
                            ),
                            border:
                                Border.all(color: Color(0xFF809EDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 110.0, minHeight: 50.0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: double.infinity, minHeight: 200.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF809EDC),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Icon(Ionicons.document_text_outline,
                                    size: 50, color: Color(0xFF809EDC)),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF809EDC),
                                      fontSize: 30),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "GOV Documents",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Icon(Ionicons.document_lock_outline,
                                    size: 50, color: Color(0xFF809EDC)),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF809EDC),
                                      fontSize: 30),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Private Documents",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Icon(Ionicons.happy_outline,
                                    size: 50, color: Color(0xFF809EDC)),
                                Text(
                                  documentNumber.isEmpty
                                      ? "0"
                                      : documentNumber.length.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF809EDC),
                                      fontSize: 30),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Entertainment",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Icon(Icons.loyalty_outlined,
                                    size: 50, color: Color(0xFF809EDC)),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF809EDC),
                                      fontSize: 30),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Loyalty",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150.0),
                  constraints: BoxConstraints(
                      maxWidth: double.infinity, minHeight: 410.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(19),
                          topRight: Radius.circular(19),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  child: SizedBox(
                    height: 250,
                    child: GridView.count(
                      padding: EdgeInsets.only(
                          left: 15, top: 15, right: 15, bottom: 25),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {
                              if (docNumber == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CameraPage()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => id_doc()),
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(

                                  //border: Border.all(color: Color(0xFF809EDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250.0, minHeight: 150.0),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/id-card.png",
                                      scale: 5,
                                    ),
                                    Text(
                                      "ID Card",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Color(0xFF809EDC),
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(

                                  //border: Border.all(color: Color(0xFF809EDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250.0, minHeight: 150.0),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/passportt.png",
                                      scale: 5,
                                    ),
                                    Text(
                                      "Passport",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Color(0xFF809EDC),
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {
                              if (scannedDocument == null &&
                                  scannedDocument2 == null) {
                                Navigator.pushNamed(context, '/frontSide');
                              } else if (scannedDocument != null &&
                                  scannedDocument2 != null) {
                                Navigator.pushNamed(context, '/license_doc');
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(

                                  //border: Border.all(color: Color(0xFF809EDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250.0, minHeight: 150.0),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/license.png",
                                      scale: 5,
                                    ),
                                    Text(
                                      "License",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Color(0xFF809EDC),
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(

                                  //border: Border.all(color: Color(0xFF809EDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250.0, minHeight: 150.0),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/cards.png",
                                      scale: 5,
                                    ),
                                    Text(
                                      "Utility",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Color(0xFF809EDC),
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          flightTicket_doc_list()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(

                                  //border: Border.all(color: Color(0xFF809EDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250.0, minHeight: 150.0),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/ticket-flight.png",
                                      scale: 5,
                                    ),
                                    Text(
                                      "Flight Tickets",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Color(0xFF809EDC),
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: RaisedButton(
                            onPressed: () {
                              delete_lists();
                              load_loyalty_lists();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loyalty_doc_list()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(

                                  //border: Border.all(color: Color(0xFF809EDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250.0, minHeight: 150.0),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/loyalty.png",
                                      scale: 5,
                                    ),
                                    Text(
                                      "Loyalty",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Color(0xFF809EDC),
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
