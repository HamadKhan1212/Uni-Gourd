import 'package:flutter/material.dart';

class AppUtils {
  static getHeight(context, double height) {
    return MediaQuery.of(context).size.height * height;
  }

  static getWidth(context, double width) {
    return MediaQuery.of(context).size.width * width;
  }

  static navigateTo(context, Widget pageName) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }

  static backTo(context) {
    Navigator.pop(context);
  }
}
