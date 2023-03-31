import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/controller/product_controller.dart';
import 'package:expire_app/screens/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/products_database.dart';
import '../../../widgets/modelPage.dart';
import '../../app_screen.dart';

class AddProductFooter extends StatefulWidget {
  final String filePath;
  final int value;
  final String note;
  final String selectCategory;
  final DateTime expireDat;

  const AddProductFooter(
      {Key? key,
      required this.filePath,
      required this.value,
      required this.note,
      required this.selectCategory,
      required this.expireDat})
      : super(key: key);

  @override
  State<AddProductFooter> createState() => _AddProductFooterState();
}

class _AddProductFooterState extends State<AddProductFooter> {
  final _productsBox = Hive.box('productsBox');

  ProductsDataBase db = ProductsDataBase();

  ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 50,
            child: SizedBox(
              child: ElevatedButton(
                  onPressed: () async {
                    if (productController.checkInputAddProduct(
                        widget.filePath,
                        widget.value,
                        widget.note,
                        widget.selectCategory,
                        widget.expireDat)) {
                      // update productsList before add new product then update _productBox
                      if (_productsBox.get("PRODUCTSLIST") != null) {
                        for (var value in _productsBox.get("PRODUCTSLIST")) {
                          db.productsList.add(value);
                        }
                        db.productsList.add([
                          widget.filePath,
                          widget.selectCategory,
                          widget.expireDat,
                          widget.note,
                          widget.value
                        ]);
                        db.updataDataBase();
                      }

                      // the frist time add product to _productBox
                      else {
                        db.productsList.add([
                          widget.filePath,
                          widget.selectCategory,
                          widget.expireDat,
                          widget.note,
                          widget.value
                        ]);
                        db.updataDataBase();
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigation()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Alert"),
                            content: Text(
                                "Please fill your information completely."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    backgroundColor: Styles.colorFont,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('SAVE', style: TextStyle(fontSize: 25))),
            ),
          ),
        ],
      ),
    );
  }
}
