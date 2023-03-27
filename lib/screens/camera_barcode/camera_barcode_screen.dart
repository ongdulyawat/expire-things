import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/screens/camera_barcode/widgets/camera_barcode_product.dart';
import 'package:flutter/material.dart';

class CameraBarcodeScreen extends StatefulWidget {
  const CameraBarcodeScreen({Key? key}) : super(key: key);

  @override
  State<CameraBarcodeScreen> createState() => _CameraBarcodeScreenState();
}

class _CameraBarcodeScreenState extends State<CameraBarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgBackground,
      body: Column(
        children: const[
          CameraBarcodeProduct(),
          //SizedBox(height: 10),
        ],
      ),
    );
  }
}
