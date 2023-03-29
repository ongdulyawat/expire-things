// ignore_for_file: prefer_const_constructors

import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_product_footer.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({Key? key}) : super(key: key);

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  String _selectCategory = "Food";
  List<String> Category = [
    "Food",
    "Fruit",
    "Eggs",
    "Vegetable",
    "Meat",
  ];
  DateTime start_date = DateTime.now();
  final TextEditingController _noteController = TextEditingController();

  ProductController productcontroller = ProductController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(color: Styles.divider, thickness: 2),
          TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            controller: _noteController,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15,top: 15),
                child: Text("Notes:"),
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
          const Divider(color: Styles.divider, thickness: 2),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text("Category"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 205.0),
                child: DropdownButton(
                  underline: Container(
                    width: 0,
                  ),
                  value: _selectCategory,
                  items: Category.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      print("-- Category : $newValue --");
                      _selectCategory = newValue!;
                    productcontroller.setTest(_selectCategory);
                    });
                  },
                ),
              )
            ],
          ),
          const Divider(color: Styles.divider, thickness: 2),
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text("Expire Date"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 195),
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? newdate1 = await showDatePicker(
                              context: context,
                              initialDate: start_date,
                              firstDate: DateTime(DateTime.now().year - 10),
                              lastDate: DateTime(DateTime.now().year + 10));
                          if (newdate1 == null) return;
                          setState(() => start_date = newdate1);
                          print(start_date);
                          print(DateFormat('yyyy-MM-dd').format(start_date));
                          // productcontroller.checkInputAddProduct();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "${start_date.day}/${start_date.month}/${start_date.year}",
                                style: const TextStyle(fontSize: 15)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Styles.divider, thickness: 2),
        ],
      ),
    );
  }
}
