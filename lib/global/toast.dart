import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
