import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';
import 'camera_overlay.dart';
import 'mrz_scanner.dart';
import 'package:VWallet/data/id_card/id_card_data.dart';
import 'package:VWallet/home/subPages/id_card_doc.dart';
import 'package:better_sound_effect/better_sound_effect.dart';
import 'package:VWallet/data/id_card/NationalIDHive_Model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final soundEffect = BetterSoundEffect();
int? soundId;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isParsed = false;
  MRZController? controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        MRZScanner(
          withOverlay: true,
          onControllerCreated: onControllerCreated,
        ),
        Positioned(
          top: 50,
          child: Text(
            "Scan Your ID Card",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        Positioned(
          top: 600,
          child: CircularProgressIndicator(
            color: Color(0xFF6982B4),
          ),
        ),
        Positioned(
          top: 120,
          child: Image.asset(
            "assets/images/credit-card (1).png",
            scale: 5,
          ),
        ),
        Positioned(
          top: 560,
          child: Text(
            "Please place back of your card inside the box",
            style: TextStyle(
                color: Color(0xFF6982B4),
                //fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        Positioned(
          top: 680,
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
                  color: Colors.red, borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
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
    )));
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      soundId =
          await soundEffect.loadAssetAudioFile("assets/images/scanSound.wav");
    });
  }

  @override
  void dispose() {
    controller?.stopPreview();
    super.dispose();
  }

  void onControllerCreated(MRZController controller) {
    this.controller = controller;
    controller.onParsed = (result) async {
      if (isParsed) {
        return;
      }
      isParsed = true;

      setState(() {
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        final String formatted = formatter.format(result.birthDate);
        final String formatted2 = formatter.format(result.expiryDate);
        docType = result.documentType;
        docNumber = result.documentNumber;
        name = result.surnames;
        lastName = result.givenNames;
        dateOfBirth = formatted;
        expiryDate = formatted2;
        country = result.nationalityCountryCode;
        sex = result.sex.toString();

        inserRecord(docType, name, lastName, docNumber, dateOfBirth, expiryDate,
            country, sex);
        //print('name: ${NationalID_class().name}');
        print(name);
        print(access.get('key_id')?.name);
      });
      soundEffect.play(soundId!);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => id_doc()),
      );

      /*showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
                  content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Document type: ${result.documentType}'),
                  Text('Country: ${result.countryCode}'),
                  Text('Surnames: ${result.surnames}'),
                  Text('Given names: ${result.givenNames}'),
                  Text('Document number: ${result.documentNumber}'),
                  Text('Nationality code: ${result.nationalityCountryCode}'),
                  Text('Birthdate: ${result.birthDate}'),
                  Text('Sex: ${result.sex}'),
                  Text('Expriy date: ${result.expiryDate}'),
                  Text('Personal number: ${result.personalNumber}'),
                  Text('Personal number 2: ${result.personalNumber2}'),
                  Text('Personal number 2: ${mrz}'),
                  ElevatedButton(
                    child: const Text('ok'),
                    onPressed: () {
                      isParsed = false;
                      return Navigator.pop(context, true);
                    },
                  ),
                ],
              )));*/
    };
    controller.onError = (error) => print(error);

    controller.startPreview();
  }
}
