import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppCommons {
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

  ///判断当前移动设备网络是否可用
  Future isNetWorkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile)
      return true;
    else if (connectivityResult == ConnectivityResult.wifi)
      return true;
    else if (connectivityResult == ConnectivityResult.none) return false;
  }

  static String attachmentBaseUrl = 'http://192.168.10.19:8080';
}
