import 'dart:math';
import 'dart:io';
import 'package:VWallet/account/login.dart';
import 'package:VWallet/home/edoc.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:fialogs/fialogs.dart';
import 'package:VWallet/scaning_screens/license_scanner/license_scanner.dart';

class driving_license extends StatefulWidget {
  driving_license({Key? key}) : super(key: key);

  @override
  State<driving_license> createState() => _driving_licenseState();
}

class _driving_licenseState extends State<driving_license> {
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
            "Driving License",
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
                    confirmationDialog(
                      context,
                      "Delete Item",
                      "Are you sure you want to delete this document?",
                      positiveButtonText: "Yes",
                      positiveButtonAction: () async {
                        Navigator.pop(context);
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
                  child: Icon(
                    Ionicons.close_circle_outline,
                    size: 30.0,
                    color: Colors.red,
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
        body: Center(
          child: Container(
            width: 350,
            height: 400,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                GestureDetector(
                  child: Container(
                    height: 105,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      //color: Colors.amber,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(-2, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: 'imageHero',
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(image: FileImage(scannedDocument!))),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen();
                    }));
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Front',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809EDC),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  child: Container(
                    height: 105,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      //color: Colors.amber,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(-2, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: 'imageHero2',
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(image: FileImage(scannedDocument2!))),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen2();
                    }));
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Back',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809EDC),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(image: FileImage(scannedDocument!))),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class DetailScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero2',
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(image: FileImage(scannedDocument2!))),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
