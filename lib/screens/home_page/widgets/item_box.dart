import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemBox extends StatefulWidget {
  final String photoPath;
  final String type;
  final String date;
  final String notes;
  const ItemBox(
      {super.key,
      required this.photoPath,
      required this.type,
      required this.date,
      required this.notes});

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  DateTime now = DateTime.now();

  late DateTime currentDate;
  late DateTime expireDate;
  bool expire = false;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    expireDate = DateTime.parse(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    Duration difference = expireDate.difference(currentDate);
    int days = difference.inDays;
    if (days <= 0) {
      expire = true;
    }

    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Theme.of(context).primaryColor.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 5)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset(
                      widget.photoPath,
                      height: 50,
                      width: 50,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.type,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 30,
                    width: double.infinity,
                    child: Center(
                        child: !expire
                            ? Text(
                                days.toString() + ' D',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            : Text(
                                'Expire',
                                style: Theme.of(context).textTheme.titleMedium,
                              )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
