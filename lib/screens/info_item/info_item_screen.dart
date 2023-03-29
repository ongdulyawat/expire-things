import 'package:expire_app/screens/info_item/widgets/info_item_body.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class InfoScreen extends StatelessWidget {
  final String photoPath;
  final String type;
  final String date;
  final String notes;
  final int index;
  const InfoScreen(
      {super.key,
      required this.photoPath,
      required this.type,
      required this.date,
      required this.notes,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgStartApp,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Expire Things",
            style: TextStyle(color: Styles.colorStartApp)),
      ),
      backgroundColor: Styles.bgBackground,
      body: InfoItemBody(
        photoPath: photoPath,
        type: type,
        date: date,
        notes: notes,
        index: index,
      ),
    );
  }
}
