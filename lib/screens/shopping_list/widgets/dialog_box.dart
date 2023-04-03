import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/screens/shopping_list/widgets/button_dialog_box.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Styles.colorDialogBox,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Add New Item"),
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialogBox(text: "Cancel", onPressed: onCancel),
                SizedBox(
                  width: 8,
                ),
                ButtonDialogBox(text: "Save", onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
