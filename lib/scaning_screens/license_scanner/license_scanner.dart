import 'dart:io';

import 'package:flutter/material.dart';

//import 'package:document_scanner/document_scanner.dart';
import 'document_scanner.dart';
import 'document_scanner2.dart';
import 'scannedImage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:VWallet/home/subPages/license_doc.dart';

File? scannedDocument;
File? scannedDocument2;

class frontSide extends StatefulWidget {
  frontSide({Key? key}) : super(key: key);

  @override
  State<frontSide> createState() => _frontSideState();
}

class _frontSideState extends State<frontSide> {
  Future<PermissionStatus>? cameraPermissionFuture;

  @override
  void initState() {
    cameraPermissionFuture = Permission.camera.request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PermissionStatus>(
      future: cameraPermissionFuture,
      builder:
          (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!.isGranted)
            // ignore: curly_braces_in_flow_control_structures
            return Stack(
              children: <Widget>[
                DocumentScanner(
                  //overlayColor: 'red',
                  captureMultiple: false,
                  enableTorch: false,
                  // documentAnimation: false,
                  noGrayScale: true,
                  onDocumentScanned: (ScannedImage scannedImage) {
                    //print("document : " + scannedImage.croppedImage!);

                    setState(() {
                      scannedDocument = scannedImage.getScannedDocumentAsFile();

                      // imageLocation = image;
                    });
                    print('test');

                    Navigator.popAndPushNamed(context, '/confirmation_scan');
                  },
                ),
                Positioned(
                  left: 40,
                  top: 80,
                  child: Text(
                    '''              Scan Front Side 
        of the Driving Licence''',
                    style: TextStyle(
                        color: Color(0xFF809EDC),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Positioned(
                  left: 155,
                  top: 140,
                  child: Image.asset(
                    "assets/images/driver_license.png",
                    scale: 5,
                  ),
                ),
                Positioned(
                  left: 85,
                  top: 650,
                  child: Text(
                    '''      Please hold your phone still 
to detect and scan your document''',
                    style: TextStyle(
                        color: Colors.red,
                        //fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Positioned(
                  left: 115,
                  top: 700,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      Navigator.pop(context);
                      //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          else
            return Center(
              child: Text("camera permission denied"),
            );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

class confirmation_scan extends StatefulWidget {
  confirmation_scan({Key? key}) : super(key: key);

  @override
  State<confirmation_scan> createState() => _confirmation_scanState();
}

class _confirmation_scanState extends State<confirmation_scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            SizedBox(
              height: 15,
            ),
            Text(
              'Front side have been scanned succsessfully!',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '''    Please flip your card and click Next 
to scan the back side of your document''',
              style: TextStyle(
                color: Color(0xFF809EDC),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              elevation: 0,
              onPressed: () {
                Navigator.popAndPushNamed(context, '/backSide');
                //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    color: Color(0xFF809EDC),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              elevation: 0,
              onPressed: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName("/edocPage"));

                //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class backSide extends StatefulWidget {
  backSide({Key? key}) : super(key: key);

  @override
  State<backSide> createState() => _backSideState();
}

class _backSideState extends State<backSide> {
  Future<PermissionStatus>? cameraPermissionFuture;

  @override
  void initState() {
    cameraPermissionFuture = Permission.camera.request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PermissionStatus>(
      future: cameraPermissionFuture,
      builder:
          (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!.isGranted)
            // ignore: curly_braces_in_flow_control_structures
            return Stack(
              children: <Widget>[
                DocumentScanner2(
                  //overlayColor: 'red',
                  captureMultiple: false,
                  enableTorch: false,
                  // documentAnimation: false,
                  noGrayScale: true,
                  onDocumentScanned: (ScannedImage scannedImage) {
                    //print("document : " + scannedImage.croppedImage!);

                    setState(() {
                      scannedDocument2 =
                          scannedImage.getScannedDocumentAsFile();

                      // imageLocation = image;
                    });
                    print('test');

                    Navigator.popAndPushNamed(context, '/license_doc');
                  },
                ),
                Positioned(
                  left: 40,
                  top: 80,
                  child: Text(
                    '''              Scan Back Side 
        of the Driving Licence''',
                    style: TextStyle(
                        color: Color(0xFF809EDC),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Positioned(
                  left: 155,
                  top: 140,
                  child: Image.asset(
                    "assets/images/driver_license.png",
                    scale: 5,
                  ),
                ),
                Positioned(
                  left: 85,
                  top: 650,
                  child: Text(
                    '''      Please hold your phone still 
to detect and scan your document''',
                    style: TextStyle(
                        color: Colors.red,
                        //fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Positioned(
                  left: 115,
                  top: 700,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      setState(() {
                        scannedDocument == null;
                        scannedDocument2 == null;
                      });
                      Navigator.pop(context);
                      //controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInSine);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          else
            return Center(
              child: Text("camera permission denied"),
            );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
