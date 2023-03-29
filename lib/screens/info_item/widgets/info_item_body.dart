import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../constants/styles.dart';
import '../../../data/products_database.dart';
import '../../../widgets/modelPage.dart';

class InfoItemBody extends StatefulWidget {
  final String photoPath;
  final String type;
  final String date;
  final String notes;
  final int index;
  const InfoItemBody(
      {Key? key,
      required this.photoPath,
      required this.type,
      required this.date,
      required this.notes,
      required this.index})
      : super(key: key);

  @override
  State<InfoItemBody> createState() => _InfoItemBodyState();
}

class _InfoItemBodyState extends State<InfoItemBody> {
  DateTime now = DateTime.now();

  late DateTime currentDate;
  late DateTime expireDate;
  bool expire = false;

  final _productBox = Hive.box('productsBox');
  ProductsDataBase db = ProductsDataBase();
  @override
  void initState() {
    currentDate = DateTime.now();
    expireDate = DateTime.parse(widget.date);
    // if this is the 1st time ever opening the appk, then create default data
    if (_productBox.get("PRODUCTSLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  void deleteTask(int index) {
    setState(() {
      db.productsList.removeAt(index);
    });
    db.updataDataBase();
  }

  @override
  Widget build(BuildContext context) {
    Duration difference = expireDate.difference(currentDate);
    int days = difference.inDays;
    if (days <= 0) {
      expire = true;
    }

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
                  child: Image.asset(
                    widget.photoPath,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(color: Styles.divider, thickness: 2),
        Container(
            height: 40,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '     Notes:  ' + widget.notes,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )),
        const Divider(color: Styles.divider, thickness: 2),
        Container(
            height: 40,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '     Category:  ' + widget.type,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )),
        const Divider(color: Styles.divider, thickness: 2),
        Container(
            height: 40,
            child: Row(
              children: [
                if (expire == false)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '     Exipre:   ' + days.toString() + ' D',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                if (expire == true)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '     Exipre:   Aleready Expire',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            )),
        const Divider(color: Styles.divider, thickness: 2),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Delete'),
                      content: Text('Are you sure you want to delete?'),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.bgStartApp,
                          ),
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop(); // close the dialog
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[200],
                          ),
                          child: Text('Delete'),
                          onPressed: () {
                            deleteTask(widget.index);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigation()));
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('DELETE', style: TextStyle(fontSize: 25))),
        ),
      ],
    );
  }
}
