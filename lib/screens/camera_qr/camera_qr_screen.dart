import 'package:expire_app/constants/styles.dart';
import 'package:flutter/material.dart';

class CameraQrScreen extends StatefulWidget {
  const CameraQrScreen({Key? key}) : super(key: key);

  @override
  State<CameraQrScreen> createState() => _CameraQrScreenState();
}

class _CameraQrScreenState extends State<CameraQrScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.bgBackground,
    );
  }
}
