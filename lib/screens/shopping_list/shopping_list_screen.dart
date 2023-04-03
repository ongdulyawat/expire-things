import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/data/database.dart';
import 'package:expire_app/screens/shopping_list/widgets/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:expire_app/screens/shopping_list/widgets/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // reference the hive box
  final _listBox = Hive.box('listBox');

  final _controller = TextEditingController();

  ShoppingDataBase db = ShoppingDataBase();

  @override
  void initState() {
    // if this is the 1st time ever opening the appk, then create default data
    if (_listBox.get("SHOPPINGLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updataDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updataDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgBackground,
      body: Column(
        children: [
          SizedBox(
            height: 590,
            child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: createNewTask,
            backgroundColor: Styles.colorFont,
            child: const Icon(Icons.add_outlined),
          )
        ],
      ),
    );
  }
}
