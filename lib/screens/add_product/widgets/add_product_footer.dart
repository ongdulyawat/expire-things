import 'package:expire_app/constants/styles.dart';
import 'package:flutter/material.dart';

class AddProductFooter extends StatefulWidget {
  const AddProductFooter({Key? key}) : super(key: key);

  @override
  State<AddProductFooter> createState() => _AddProductFooterState();
}

class _AddProductFooterState extends State<AddProductFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 50,
            child: SizedBox(
              child: ElevatedButton(
                  onPressed: () async {
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    foregroundColor: Styles.colorFont,
                    backgroundColor: Styles.bgBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child:
                  const Text('DELETE', style: TextStyle(fontSize: 25))),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            flex: 50,
            child: SizedBox(
              child: ElevatedButton(
                  onPressed: () async {
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    backgroundColor: Styles.colorFont,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child:
                  const Text('SAVE', style: TextStyle(fontSize: 25))),
            ),
          ),
        ],
      ),
    );
  }
}
