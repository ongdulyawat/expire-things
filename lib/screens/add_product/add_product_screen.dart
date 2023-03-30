import 'package:expire_app/constants/styles.dart';
import 'package:expire_app/screens/add_product/widgets/add_product_body.dart';
import 'package:expire_app/screens/add_product/widgets/add_product_footer.dart';
import 'package:expire_app/screens/add_product/widgets/add_product_header.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgBackground,
      body: Column(
        children: const [
          AddProductHeader(),
          // SizedBox(height: 10),
          // AddProductBody(),
          // SizedBox(height: 10),
          // AddProductFooter()
        ],
      ),
    );
  }
}
