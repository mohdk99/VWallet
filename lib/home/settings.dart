import 'package:VWallet/biometrics_authentication/screen_lock_provider.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:VWallet/biometrics_authentication/db_provider.dart';

class settingsPage extends StatefulWidget {
  settingsPage({Key? key}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  bool _secured = false;
  @override
  void initState() {
    super.initState();
    DbProvider().getAuthState().then((value) {
      setState(() {
        _secured = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFF809EDC),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.fingerprint_rounded,
                size: 35,
                color: Colors.white,
              ),
            ),
            title: const Text("Biometrics"),
            subtitle: const Text("Login with fingerprint or FaceID"),
            trailing: Switch(
                activeColor: Color(0xFF809EDC),
                value: _secured,
                onChanged: (value) {
                  setState(() {
                    _secured = value;
                  });
                  ScreenLock(ctx: context).authenticateUser(
                      value: value, message: "Please confirm fingerprint");
                }),
          )
        ],
      )),
    ));
  }
}
