import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/login/action.dart';

import 'state.dart';

Widget buildView(
  LoginState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                '登录',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 30.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                '用户名',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: TextField(
                controller: state.userNameController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding:
                      EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
                ),
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[500],
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text(
                '密码',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: TextField(
                        obscureText: state.isClose,
                        controller: state.passwordController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: '请输入密码',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.only(
                              top: 10.0, right: 20.0, bottom: 10.0),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(LoginActionCreator.onSwitchEyeAction());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.all(5.0),
                      child: _buildEyeIcon(state.isClose),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[500],
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: RaisedButton(
                  onPressed: () {
                    dispatch(LoginActionCreator.onLogin());
                  },
                  color: Colors.blue,
                  child: Text(
                    "立即登录",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _buildEyeIcon(bool isClose) {
  if (isClose) {
    return Icon(
      Icons.remove_red_eye,
      color: Colors.grey,
    );
  } else {
    return Icon(
      Icons.remove_red_eye,
      color: Colors.black,
    );
  }
}
