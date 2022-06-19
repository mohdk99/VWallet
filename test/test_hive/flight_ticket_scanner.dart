import 'package:elegant_notification/resources/arrays.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
//import 'package:VWallet/data/loyalty_doc_data.dart';
import 'package:VWallet/home/edoc.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:better_sound_effect/better_sound_effect.dart';
import 'package:intl/intl.dart';
import 'package:VWallet/data/flight_ticket/flight_ticket_data.dart';
import 'package:VWallet/home/subPages/flight_ticket_doc.dart';
//import 'package:VWallet/data/test_data.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('dd/MM/yyyy');
final String formatted = formatter.format(now);
String check_code = '';

/*List<String> document = documentNumber;
List<String> name = cardHolder;
List<String> date = createdDate;*/

class flight_ticket_scanner extends StatefulWidget {
  flight_ticket_scanner({Key? key}) : super(key: key);

  @override
  State<flight_ticket_scanner> createState() => _flight_ticket_scannerState();
}

class _flight_ticket_scannerState extends State<flight_ticket_scanner> {
  //String? _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;
  final soundEffect = BetterSoundEffect();

  int? soundId;
  int? error;
  int? success_sound;

  void addItem(String code) async {
    String final_code = code.toString();
    final newIndex = 0;
    String firstName = final_code.substring(
        final_code.indexOf('/') + 1, final_code.indexOf(' ') - 2);
    String lastName = final_code.substring(2, final_code.indexOf('/'));
    String dep = final_code.substring(30, 33);
    String dis = final_code.substring(33, 36);
    String airline = final_code.substring(36, 38);
    String flight_number = final_code.substring(36, 43);
    String b_class = final_code[47];
    String seat = final_code.substring(49, 52);
    //String string = loyalty[0].documentNumber;
    flightTicket.insert(
        newIndex,
        FlightTicket(
            ticketCode: code,
            firstName: firstName,
            lastName: lastName,
            dep: dep,
            dis: dis,
            airline: airline,
            flight_number: flight_number,
            b_class: b_class,
            seat: seat,
            createdDate: formatted));

    //createdDate.insert(newIndex, formatted);
    insertFlightData(code, firstName, lastName, formatted, b_class,
        flight_number, seat, dep, dis, airline);
    listKey.currentState?.insertItem(newIndex);

    // await saveStringListValue(string ,newIndex.toString());
  }

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      check_code = code!;
      // _qrInfo = code;
      print(code);
      //soundEffect.play(soundId!);

      if (flightTicket
          .where((element) => element.ticketCode == code)
          .isNotEmpty) {
        Navigator.pop(context);
        soundEffect.play(error!);
        ElegantNotification.error(
                toastDuration: Duration(seconds: 2),
                height: 70,
                animation: ANIMATION.fromTop,
                title: Text("Denied"),
                description: Text("Document already exist"))
            .show(context);
      } else {
        addItem(code.toString());

        Navigator.pop(context);

        soundEffect.play(success_sound!);
        //print(flightTicket[0].firstName);
        ElegantNotification.success(
                toastDuration: Duration(seconds: 2),
                height: 70,
                animation: ANIMATION.fromTop,
                title: Text("Added Flight Ticket"),
                description: Text("You added a ticket successfully"))
            .show(context);
      }
      print('First Name: ${flightTicket[0].firstName}');
      /*titleIcon: Icon(
                                Ionicons.alert_circle_outline,
                                color: Color(0xFF809EDC),
                              ),*/

      /*else if (type != int) {
        Navigator.pop(context);
        soundEffect.play(error!);
        ElegantNotification.error(
                toastDuration: Duration(seconds: 2),
                height: 70,
                animation: ANIMATION.fromTop,
                title: Text("Denied"),
                description: Text("Invalid Document Type"))
            .show(context);
      }*/
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
    Future.microtask(() async {
      soundId =
          await soundEffect.loadAssetAudioFile("assets/images/scanSound.wav");
      error =
          await soundEffect.loadAssetAudioFile("assets/images/errorSound.wav");
      success_sound =
          await soundEffect.loadAssetAudioFile("assets/images/success.wav");
    });
  }

  @override
  void dispose() {
    if (soundId != null) {
      soundEffect.release(soundId!);
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: _camState
            ? Center(
                child: SizedBox(
                  height: 1000,
                  width: 500,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      CameraOverlay(
                        child: QRBarScannerCamera(
                          onError: (context, error) => Text(
                            error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          qrCodeCallback: (code) {
                            _qrCallback(code);
                          },
                        ),
                      ),
                      Positioned(
                        top: 100,
                        child: Text(
                          "Scan the QR/Barcode",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      Positioned(
                        top: 580,
                        child: CircularProgressIndicator(
                          color: Color(0xFF6982B4),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Image.asset(
                          "assets/images/barcode.png",
                          scale: 5,
                        ),
                      ),
                      Positioned(
                        top: 530,
                        child: Text(
                          "Please place the code inside the box",
                          style: TextStyle(
                              color: Color(0xFF6982B4),
                              //fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Positioned(
                        top: 650,
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
                              constraints: BoxConstraints(
                                  maxWidth: 180.0, minHeight: 50.0),
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
                  ),
                ),
              )
            : null);
  }
}

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({
    required this.child,
    Key? key,
  }) : super(key: key);

  static const _documentFrameRatio =
      2; // Passport's size (ISO/IEC 7810 ID-3) is 125mm × 88mm
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        final overlayRect =
            _calculateOverlaySize(Size(c.maxWidth, c.maxHeight));
        return Stack(
          children: [
            child,
            ClipPath(
              clipper: _DocumentClipper(rect: overlayRect),
              child: Container(
                foregroundDecoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.45),
                ),
              ),
            ),
            _WhiteOverlay(rect: overlayRect),
          ],
        );
      },
    );
  }

  RRect _calculateOverlaySize(Size size) {
    double width, height;
    if (size.height > size.width) {
      width = size.width * 0.9;
      height = width / _documentFrameRatio;
    } else {
      height = size.height * 0.75;
      width = height * _documentFrameRatio;
    }
    final topOffset = (size.height - height) / 2;
    final leftOffset = (size.width - width) / 2;

    final rect = RRect.fromLTRBR(leftOffset, topOffset, leftOffset + width,
        topOffset + height, const Radius.circular(8));
    return rect;
  }
}

class _DocumentClipper extends CustomClipper<Path> {
  _DocumentClipper({
    required this.rect,
  });

  final RRect rect;

  @override
  Path getClip(Size size) => Path()
    ..addRRect(rect)
    ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
    ..fillType = PathFillType.evenOdd;

  @override
  bool shouldReclip(_DocumentClipper oldClipper) => false;
}

class _WhiteOverlay extends StatelessWidget {
  const _WhiteOverlay({
    required this.rect,
    Key? key,
  }) : super(key: key);
  final RRect rect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: rect.left,
            top: 425,
            child: Container(
              width: rect.width,
              height: 1,
              color: Colors.red,
              alignment: Alignment.center,
            )),
        Positioned(
          left: rect.left,
          top: rect.top,
          child: Container(
            width: rect.width,
            height: rect.height,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: const Color(0xFF6982B4)),
              borderRadius: BorderRadius.all(rect.tlRadius),
            ),
          ),
        ),
      ],
    );
  }
}
