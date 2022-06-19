import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';
import 'package:VWallet/biometrics_authentication/db_provider.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:VWallet/home/navigation_bar.dart';
import 'package:VWallet/data/loyalty_doc_data.dart';

class ScreenLock {
  BuildContext? ctx;
  ScreenLock({this.ctx});

  LocalAuthentication localAuth = LocalAuthentication();

  void authenticateUser({String? path, bool? value, String? message}) async {
    bool cancheckBiometrics = await localAuth.canCheckBiometrics;

    if (cancheckBiometrics == true) {
      List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.face)) {
          //Face ID
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          //Touch ID
          bool didAuthenticate =
              await localAuth.authenticate(localizedReason: message!);

          if (path == 'loginPage') {
            if (didAuthenticate == true) {
              //Success , save sate
              Navigator.of(ctx!).pushAndRemoveUntil<dynamic>(
                  MaterialPageRoute<dynamic>(builder: (context) => home()),
                  (Route<dynamic> route) => false);
              //delete_lists();
              //load_loyalty_lists();
              ElegantNotification.success(
                      toastDuration: Duration(seconds: 2),
                      height: 70,
                      animation: ANIMATION.fromTop,
                      title: Text("Logged In"),
                      description: Text("You logged in successfully"))
                  .show(ctx!);
              print('Success');
            } else {
              //Failed
              print('Failed');
            }
          } else {
            if (didAuthenticate == true) {
              //Success , save sate
              DbProvider().saveAuthState(value!);
              print('Success');
            } else {
              //Failed
              print('Failed');
            }
          }
        }
      }
    }
  }
}
