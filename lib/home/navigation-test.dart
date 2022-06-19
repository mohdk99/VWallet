import 'package:VWallet/home/bottom_controller.dart';
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
import 'bottom_controller.dart';
import 'edoc.dart';
import 'history.dart';
import 'settings.dart';
import 'profile.dart';

class navBar extends StatefulWidget {
  navBar({Key? key}) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  final iconList = [
    Icons.document_scanner_outlined,
    Icons.access_time_outlined,
    Ionicons.settings_outline,
    Ionicons.person_circle_outline,
  ];
  final controller = Get.put(BottomBarController());
  int _currentTab = 0;
  Widget _currentScreen = eDocPage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: _currentScreen,
          floatingActionButton: FloatingActionButton(
            elevation: 8,
            backgroundColor: HexColor('#809EDC'),
            child: Icon(
              Iconsax.wallet_money,
              color: HexColor('#ffffff'),
            ),
            onPressed: () => controller.setIndex(-1),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? HexColor('#809EDC') : Colors.grey;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 24,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  )
                ],
              );
            },
            backgroundColor: HexColor('#ffffff'),
            splashColor: HexColor('#809EDC'),
            //notchAndCornersAnimation: animation,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.softEdge,
            gapLocation: GapLocation.center,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            activeIndex: _currentTab,
            onTap: (index) {
              setState(() {
                _currentTab = index;
                _currentScreen = index == 0
                    ? eDocPage()
                    : index == 1
                        ? historyPage()
                        : (index == 2)
                            ? settingsPage()
                            : profilePage();
                //_currentScreen = (int == 2) ? settingsPage() : profilePage();

//controller.getIndex()==-1 ?"Home" :  controller.getIndex()==-1 ?eDocPage() : controller.getIndex()==-1 ?historyPage(): controller.getIndex()==-1 ?settingsPage(): controller.getIndex()==-1 ?profilePage()
              });
              print(int);
            },
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
