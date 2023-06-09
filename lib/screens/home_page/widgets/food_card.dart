import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../../../data/products_database.dart';
import 'item_box.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  final _productBox = Hive.box('productsBox');
  ProductsDataBase db = ProductsDataBase();
  @override
  void initState() {
    // if this is the 1st time ever opening the appk, then create default data
    if (_productBox.get("PRODUCTSLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 40),
      child: GridView.builder(
        itemCount: db.productsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (context, index) {
          return ItemBox(
            photoPath: db.productsList[index][0],
            type: db.productsList[index][1],
            // date: db.productsList[index][2],
            date: DateFormat('yyyy-MM-dd').format(db.productsList[index][2]),
            notes: db.productsList[index][3],
            index: index,
          );
        },
      ),
    );
  }
}
