import 'package:hive_flutter/hive_flutter.dart';

class ProductsDataBase {
  List productsList = [];

  // reference the hive box
  final _productsBox = Hive.box('productsBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    productsList = [
      ['assets/images/tomato.png', 'Fruit', '2023-04-10', 'กินผักเยอะๆนะ'],
      ['assets/images/tomato.png', 'Fruit', '2023-03-25', 'กินผักเยอะๆนะ']
    ];
  }

  // load the data from database
  void loadData() {
    productsList = _productsBox.get("PRODUCTSLIST");
  }

  // update the database
  void updataDataBase() {
    _productsBox.put("PRODUCTSLIST", productsList);
  }
}
