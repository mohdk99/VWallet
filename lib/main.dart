import 'package:VWallet/data/flight_ticket/flight_ticket_data.dart';
import 'package:VWallet/data/id_card/NationalIDHive_Model.dart';
import 'package:VWallet/home/edoc.dart';
import 'package:VWallet/test2.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'account/login.dart';
import 'account/signupPanel.dart';
//import 'package:custom_splash/custom_splash.dart';
import 'test.dart';
import 'test3.dart';
import 'home/navigation_bar.dart';
import 'home/navigation-test.dart';
import 'package:VWallet/data/loyalty_doc_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:VWallet/scaning_screens/license_scanner/license_scanner.dart';
import 'package:VWallet/home/subPages/license_doc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicaionDocumentation =
      await getApplicationDocumentsDirectory(); // Storing path
  await Hive.initFlutter(applicaionDocumentation.path);
  Hive.registerAdapter(NationalIDclassAdapter());
  await Hive.openBox<NationalID_class>('national_id');
  Hive.registerAdapter(FlightTicketAdapter());
  await Hive.openBox<FlightTicket>('flight_ticket_id'); // Open box
  runApp(new MyApp());
  //await SaveData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 869),
      //minTextAdapt: true,
      //splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (pre ss "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<PermissionStatus>(
          future: Permission.camera.request(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == PermissionStatus.granted) {
              return loginPage();
            }
            if (snapshot.data == PermissionStatus.permanentlyDenied) {
              // The user opted to never again see the permission request dialog for this
              // app. The only way to change the permission's status now is to let the
              // user manually enable it in the system settings.
              openAppSettings();
            }
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Awaiting for permissions'),
                    ),
                    Text('Current status: ${snapshot.data?.toString()}'),
                  ],
                ),
              ),
            );
          },
        ),
        routes: {
          '/edocPage': (context) => eDocPage(),
          '/frontSide': (context) => frontSide(),
          '/confirmation_scan': (context) => confirmation_scan(),
          '/backSide': (context) => backSide(),
          '/license_doc': (context) => driving_license(),
        },
      ),
    );
  }
}
