import 'dart:io';
import 'package:expire_app/constants/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'add_product_body.dart';

class AddProductHeader extends StatefulWidget {
  const AddProductHeader({Key? key}) : super(key: key);

  @override
  State<AddProductHeader> createState() => _AddProductHeaderState();
}

class _AddProductHeaderState extends State<AddProductHeader> {
  bool isFile = false;
  File? fileImage;
  late Uint8List memoryImage;
  String pathPicUse = "";

  int value = 1;

  void add() {
    setState(() {
      value++;
    });
  }

  void delete() {
    setState(() {
      value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    const urlImage = "assets/images/tomato.png";

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                color: Styles.colorStartApp,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: fileImage == null
                    ? Image.asset(
                        urlImage,
                        fit: BoxFit.cover,
                      )
                    : Image.file(fileImage!),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile == null) return;
                isFile = true;
                if (isFile) {
                  final file = File(pickedFile.path);

                  setState(() {
                    fileImage = file;
                    pathPicUse = pickedFile.path;
                    // save file
                    // pickedFile.saveTo(pathPicUse);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Styles.colorFont,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child:
                  const Text('use strickers', style: TextStyle(fontSize: 18))),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  delete();
                  if (value <= 1) {
                    setState(() {
                      value = 1;
                    });
                  }
                },
                child: const Icon(
                  Icons.remove,
                  color: Styles.colorFont,
                  size: 25,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 65, right: 65),
              child: Text("$value", style: const TextStyle(fontSize: 20)),
            ),
            GestureDetector(
                onTap: () {
                  add();
                },
                child: const Icon(
                  Icons.add,
                  color: Styles.colorFont,
                  size: 25,
                )),
          ],
        ),
        SizedBox(height: 10),
        AddProductBody(filePath: pathPicUse, value: value)
      ],
    );
  }
}
