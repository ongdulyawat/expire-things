import 'package:hive_flutter/hive_flutter.dart';

class ShoppingDataBase {
  List toDoList = [];

  // reference the hive box
  final _listBox = Hive.box('listBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      // ["Apple", false],
      // ["Egg", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _listBox.get("SHOPPINGLIST");
  }

  // update the database
  void updataDataBase() {
    _listBox.put("SHOPPINGLIST", toDoList);
  }
}
