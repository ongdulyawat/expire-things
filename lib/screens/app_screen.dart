import 'dart:async';

import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/widgets/modelPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home_page/home_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(const BottomNavigation());
    });
    // Timer(const Duration(seconds: 3), () {
    //   Get.to(const HomePage());
    // });
    return Scaffold(
      backgroundColor: Styles.bgStartApp,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ImageIcon(
              AssetImage("assets/icons/calendar.png"),
              color: Styles.colorStartApp,
              size: 150,
            ),
            SizedBox(height: 20.0),
            Text(
              "Expire Things",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Styles.colorStartApp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
