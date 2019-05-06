import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertGlobal {
  void showAlert(
      {String title,
      String desc,
      BuildContext context,
      VoidCallback callback}) {
    NavigatorState navigator =
        context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    Alert(
      context: context,
      title: title,
      desc: desc,
      style: AlertStyle(
        isCloseButton: false,
        titleStyle: TextStyle(fontSize: 18.0),
        descStyle: TextStyle(fontSize: 16.0),
      ),
      buttons: [
        DialogButton(
          height: 45.0,
          child: Text(
            "确定",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          color: Colors.blue[600],
          onPressed: callback,
        ),
        DialogButton(
          height: 45.0,
          child: Text(
            "取消",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          color: Colors.red,
          onPressed: () => navigator.pop(context),
        )
      ],
    ).show();
  }
}
