import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';

// ignore: must_be_immutable
class IndexWillPop extends StatelessWidget {
  Widget child;

  IndexWillPop({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: child, onWillPop: doubleClickBack);
  }

  //双击home键退出应用程序
  int _lastClickTime = 0;
  Future<bool> doubleClickBack() {
    int nowTime = DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return Future.value(true);
    } else {
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      AppCommons.showToast("再按一次后退键退出程序");
      return Future.value(false);
    }
  }
}
