import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:inspection/index/page.dart';
import 'package:inspection/login/page.dart';

import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return SplashPageWidget();
}

class SplashPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPageWidget>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  AnimationStatusListener animationStateListener;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    animationStateListener = (status) {
      _judgeIsLogin(status);
    };
    _animation.addStatusListener(animationStateListener);
    _controller.forward();
  }

//判断是否已经登录
  void _judgeIsLogin(AnimationStatus status) async {
    int isLoginOk;
    await SpUtils().getInt("isLoginOk").then((value) {
      isLoginOk = value;
    });
    if (isLoginOk == 1) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => IndexPage().buildPage(null)),
            (route) => route == null);
      }
    } else {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => LoginPage().buildPage(null)),
            (route) => route == null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/img_splash.png",
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener(animationStateListener);
    _controller.dispose();
    super.dispose();
  }
}
