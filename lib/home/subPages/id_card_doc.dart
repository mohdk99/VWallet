import 'dart:math';

import 'package:VWallet/account/login.dart';

import 'package:elegant_notification/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:fialogs/fialogs.dart';
import 'package:VWallet/data/id_card/id_card_data.dart';
import 'package:VWallet/data/id_card/NationalIDHive_Model.dart';
import 'package:VWallet/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class id_doc extends StatefulWidget {
  id_doc({Key? key}) : super(key: key);

  @override
  State<id_doc> createState() => _id_docState();
}

class _id_docState extends State<id_doc> {
  /*@override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }*/
  dynamic docNumber = access.get('key_id')?.docNumber;
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
            "National ID",
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
              //print(Hive.isBoxOpen('national_id'));
              //Hive.close();
              print(Hive.isBoxOpen('national_id'));
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
                        await access.delete('key_id');
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

                    print('Check: ${Hive.isBoxOpen('national_id')}');
                  },
                  child: Icon(
                    Ionicons.close_circle_outline,
                    size: 30.0,
                    color: Colors.red,
                  ),
                )),
          ],
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.only(left: 5, right: 10, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(children: [
              Positioned(
                left: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NAME: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'CIVIL ID: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'DATE OF BIRTH: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'EXPIRY DATE: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 95,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage("assets/images/user_frame.png"),
                        scale: 1,
                      ),
                    ),
                  )),
              Positioned(
                top: 130,
                left: 100,
                child: BarcodeWidget(
                  color: Colors.grey.shade900,
                  drawText: false,
                  barcode: Barcode.itf(zeroPrepend: true),
                  data: docNumber.toString(),
                  width: 150,
                  height: 30,
                ),
              ),
              Positioned(
                left: 140,
                child: Text(
                  '${access.get('key_id')?.name}', // Display name from the database
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809EDC),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 29,
                child: Text(
                  '${access.get('key_id')?.docNumber}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809EDC),
                  ),
                ),
              ),
              Positioned(
                left: 192,
                top: 58,
                child: Text(
                  '${access.get('key_id')?.dateofBirth}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809EDC),
                  ),
                ),
              ),
              Positioned(
                left: 178,
                top: 87,
                child: Text(
                  '${access.get('key_id')?.expiryDate}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809EDC),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
