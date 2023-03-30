import 'dart:io';
import 'dart:math';
import 'package:expire_app/data/products_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../constants/styles.dart';

class CameraBarcodeProduct extends StatefulWidget {
  const CameraBarcodeProduct({Key? key}) : super(key: key);

  @override
  State<CameraBarcodeProduct> createState() => _CameraBarcodeProductState();
}

class _CameraBarcodeProductState extends State<CameraBarcodeProduct> {
  // reference the hive box
  final _productsBox = Hive.box('productsBox');

  ProductsDataBase db = ProductsDataBase();

  bool isFile = false;
  File? fileImage;
  late Uint8List memoryImage;
  String typeCategory = '';
  String pathPic = 'assets/images/';
  String pathPicUse = '';
  int value = 0;
  final TextEditingController _noteController = TextEditingController();

  Random random = Random();

  @override
  void initState() {
    // if this is the 1st time ever opening the appk, then create default data
    if (_productsBox.get("PRODUCTSLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
    randomPick();
  }

  String generateRandomNumber() {
    String randomNumber = '';
    for (var i = 0; i < 10; i++) {
      randomNumber += random.nextInt(10).toString();
    }
    return randomNumber;
  }

  String generateRandomDate() {
    final now = DateTime.now();
    final randomYear = now.year + Random().nextInt(2); // 0 or 1 year in future
    final randomMonth = Random().nextInt(12) + 1; // 1-12
    final randomDay = Random().nextInt(31) + 1; // 1-31
    final randomDate = DateTime(randomYear, randomMonth, randomDay);
    return DateFormat("yyyy-MM-dd").format(randomDate);
  }

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

  void randomPick() {
    List<String> listPic = [
      'chips.jpg',
      'milk.jpg',
      'softdrink.jpg',
      'watermelon.jpg'
    ];
    //Random randomPic = Random();
    int randomIndex = random.nextInt(listPic.length);
    String randomEle = listPic[randomIndex];
    pathPicUse = pathPic + randomEle;
    if (randomIndex == 0) {
      typeCategory = 'Snacks';
    } else if (randomIndex == 1 || randomIndex == 2) {
      typeCategory = 'Drink';
    } else {
      typeCategory = 'Fruit';
    }
  }

  void cancel() {
    setState(() {
      _noteController.clear();
      randomPick();
      fileImage = null;
    });
  }

  void save() {
    setState(() {
      db.productsList.add([
        pathPicUse,
        typeCategory,
        generateRandomDate(),
        _noteController.text.toString()
      ]);
    });
    // Navigator.of(context).pop();
    db.updataDataBase();
    print(db.productsList);
    randomPick();
    _noteController.clear();
    fileImage = null;
    // Implement your save functionality here
  }

  @override
  Widget build(BuildContext context) {
    const barcodeImage = "assets/images/barcode.jpeg";

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                //color: Styles.colorStartApp,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: fileImage == null
                      ? Image.asset(
                          barcodeImage,
                          fit: BoxFit.cover,
                        )
                      //: Image.file(fileImage!),
                      : Image.asset(
                          pathPicUse,
                          fit: BoxFit.cover,
                        )),
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
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text('Add Barcode', style: TextStyle(fontSize: 18))),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (fileImage != null)
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      'Barcode Number : ${generateRandomNumber()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (fileImage != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Category : ' + typeCategory,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (fileImage != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Expire date : ${generateRandomDate()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (fileImage != null)
          TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            controller: _noteController,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Text(
                  "Notes:",
                  style: TextStyle(
                    fontSize: 18, // adjust the font size here
                    fontWeight: FontWeight.bold, // add bold weight if needed
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.transparent,
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              hintText: '(optionals)',
            ),
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: fileImage == null ? null : cancel,
                  child: const Text('Cancel', style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: fileImage == null ? null : save,
                  child: const Text('SAVE', style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
