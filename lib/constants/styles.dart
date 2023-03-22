import 'package:flutter/material.dart';

class Styles {
  static const Color bgStartApp = Color.fromRGBO(0, 171, 132, 1);
  static const Color divider = Color.fromRGBO(219, 228, 198, 1);
  static const Color bgBackground = Color.fromRGBO(217, 244, 218, 1);
  static const Color colorBar = Color.fromRGBO(242, 240, 235, 1);
  static const Color colorFont = Color.fromRGBO(175, 133, 92, 1);
  static const Color colorStartApp = Color.fromRGBO(236, 235, 189, 1);

  static var boxShadows = [
    const BoxShadow(
      color: Colors.black12,
      spreadRadius: 0.1,
      blurRadius: 3,
      offset: Offset(0, 2), // changes position of shadow
    ),
  ];
}
