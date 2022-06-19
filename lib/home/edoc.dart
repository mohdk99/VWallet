import 'dart:ui';

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
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:VWallet/data/id_card/NationalIDHive_Model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.0.h,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0.w,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 10.0.w,
                          top: 8.0.h,
                          right: 0.0.w,
                          bottom: 0.0.h),
                      height: 35.h,
                      //width: 160,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: double.infinity),
                        margin: EdgeInsets.only(
                            left: 45.0.w,
                            top: 11.0.h,
                            right: 0.0.w,
                            bottom: 0.0.w),
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
                      height: 50.h,
                      width: 50.w,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/star1.png"),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF809EDC),
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(color: Color(0xFF809EDC), width: 2.w),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 120.w),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Ionicons.notifications_outline,
                        color: Color(0xFF809EDC),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => loginPage()));
                        },
                        icon: Icon(
                          Ionicons.exit_outline,
                          color: Colors.red[400],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, bottom: 10.h),
              child: Text(
                'Our Partners',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    //sfontWeight: FontWeight.bold,
                    fontSize: 25.sp),
              ),
            ),
            Container(
              height: 170.h,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                children: [
                  // SizedBox(width: 15),
                  Stack(children: [
                    Container(
                      height: 170.h,
                      width: 100.w,
                      child: RaisedButton(
                        elevation: 2,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: HexColor('11438d'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 110.0.w, minHeight: 50.0.h),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70.h,
                        left: 30.w,
                        child: Image(
                          color: Colors.white10,
                          width: 70.w,
                          height: 70.h,
                          image: AssetImage("assets/images/shape4.png"),
                        )),
                    Positioned(
                      top: 123.5.h,
                      left: 40.w,
                      child: ButtonTheme(
                        minWidth: 60.0.w,
                        height: 25.0.h,
                        child: RaisedButton(
                          color: HexColor('5a7aba'),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(3))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "more",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 85.h,
                        left: 8.w,
                        child: Text(
                          'ROP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23.sp,
                            letterSpacing: 2,
                          ),
                        )),
                    Positioned(
                        top: 5.h,
                        left: 55.w,
                        child: Image(
                          width: 40.w,
                          height: 40.h,
                          image: AssetImage("assets/images/rop.png"),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Image(
                          color: Colors.white10,
                          width: 50.w,
                          height: 50.h,
                          image: AssetImage("assets/images/shape3.png"),
                        )),
                  ]),

                  SizedBox(width: 15.w),

                  Stack(children: [
                    Container(
                      height: 170,
                      width: 100,
                      child: RaisedButton(
                        elevation: 1,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: HexColor('85a5d5'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 110.0, minHeight: 50.0),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 90,
                        left: 50,
                        child: Image(
                          color: Colors.white10,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape2.png"),
                        )),
                    Positioned(
                      top: 123.5,
                      left: 40,
                      child: ButtonTheme(
                        minWidth: 60.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: HexColor('0055a9'),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(3))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "more",
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
                        top: 85,
                        left: 8,
                        child: Text(
                          'GUtech',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            letterSpacing: 1,
                          ),
                        )),
                    Positioned(
                        top: 7,
                        left: 28,
                        child: Image(
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/gutech_logo1.png"),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Image(
                          color: Colors.white10,
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/shape1.png"),
                        )),
                  ]),
                  SizedBox(width: 15),
                  Stack(children: [
                    Container(
                      height: 170,
                      width: 100,
                      child: RaisedButton(
                        elevation: 2,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: HexColor('dba63d'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 110.0, minHeight: 50.0),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 123.5,
                      left: 40,
                      child: ButtonTheme(
                        minWidth: 60.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: HexColor('42241c'),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(3))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "more",
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
                        top: 0,
                        left: 35,
                        child: Image(
                          color: Colors.white10,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape5.png"),
                        )),
                    Positioned(
                        top: 85,
                        left: 8,
                        child: Text(
                          'Shukran',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                            letterSpacing: 2,
                          ),
                        )),
                    Positioned(
                        top: 2,
                        left: 49,
                        child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/shukran_logo.png"),
                        )),
                    Positioned(
                        top: 70,
                        left: 0,
                        child: Image(
                          color: Colors.white10,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape6.png"),
                        )),
                  ]),
                  SizedBox(width: 15),
                  Stack(children: [
                    Container(
                      height: 170,
                      width: 100,
                      child: RaisedButton(
                        elevation: 3,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: HexColor('1a1a1a'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 110.0, minHeight: 50.0),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 30,
                        left: 30,
                        child: Image(
                          color: Colors.white10,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape4.png"),
                        )),
                    Positioned(
                        top: 90,
                        left: 0,
                        child: Image(
                          color: Colors.white10,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape7.png"),
                        )),
                    Positioned(
                      top: 123.5,
                      left: 40,
                      child: ButtonTheme(
                        minWidth: 60.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: HexColor('ddcf21'),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(3))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "more",
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
                        top: 85,
                        left: 8,
                        child: Text(
                          'M&S',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            letterSpacing: 2,
                          ),
                        )),
                    Positioned(
                        top: 7,
                        left: 42,
                        child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/m&s.png"),
                        )),
                  ]),
                  SizedBox(width: 15),
                  Stack(children: [
                    Container(
                      height: 170,
                      width: 100,
                      child: RaisedButton(
                        elevation: 2,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: HexColor('ed2527'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 110.0, minHeight: 50.0),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 90,
                        left: 50,
                        child: Image(
                          color: Colors.white30,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape2.png"),
                        )),
                    Positioned(
                      top: 123.5,
                      left: 40,
                      child: ButtonTheme(
                        minWidth: 60.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: HexColor('0e5aa6'),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(3))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "more",
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
                        top: 85,
                        left: 8,
                        child: Text(
                          'Carrefour',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            letterSpacing: 0,
                          ),
                        )),
                    Positioned(
                        top: 3,
                        left: 50,
                        child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/carrefour.png"),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Image(
                          color: Colors.white30,
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/shape1.png"),
                        )),
                  ]),
                  SizedBox(width: 15),
                  Stack(children: [
                    Container(
                      height: 170,
                      width: 100,
                      child: RaisedButton(
                        elevation: 2,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: HexColor('749b42'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 110.0, minHeight: 50.0),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        left: 30,
                        child: Image(
                          color: Colors.white10,
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/shape4.png"),
                        )),
                    Positioned(
                      top: 123.5,
                      left: 40,
                      child: ButtonTheme(
                        minWidth: 60.0,
                        height: 25.0,
                        child: RaisedButton(
                          color: HexColor('057a98'),
                          elevation: 0,
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(3))),
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "more",
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
                        top: 85,
                        left: 8,
                        child: Text(
                          'Salam Air',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                            letterSpacing: 0,
                          ),
                        )),
                    Positioned(
                        top: 5,
                        left: 25,
                        child: Image(
                          width: 70,
                          height: 70,
                          image: AssetImage("assets/images/salamAirLogo.png"),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Image(
                          color: Colors.white10,
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/shape3.png"),
                        )),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Text(
                'Digital Documents',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    //sfontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
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
                            onPressed: () async {
                              if (Hive.isBoxOpen('national_id') == false) {
                                await Hive.openBox<NationalID_class>(
                                    'national_id');
                              } else if (access.get('key_id') == null &&
                                  Hive.isBoxOpen('national_id') == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CameraPage()),
                                );
                              } else if (access.get('key_id') != null &&
                                  Hive.isBoxOpen('national_id') == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => id_doc()),
                                );
                              } else {
                                print('Hive database is open');
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
