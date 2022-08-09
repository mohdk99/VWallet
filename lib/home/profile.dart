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

class profilePage extends StatefulWidget {
  profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "User Profile Section",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
