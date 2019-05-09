import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/login/action.dart';

import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '登录',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: state.userNameController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15, color: Colors.black),
              decoration: InputDecoration(
                hintText: "请输入用户名",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: TextField(
              controller: state.passwordController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15, color: Colors.black),
              decoration: InputDecoration(
                hintText: "请输入密码",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: RaisedButton(
                onPressed: () {
                  dispatch(LoginActionCreator.onLogin());
                },
                color: Colors.red,
                child: Text(
                  "立即登录",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
                textColor: Colors.white,
                padding:
                    EdgeInsets.only(right: 120, left: 120, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          )
        ],
      ),
    ),
  );
}
