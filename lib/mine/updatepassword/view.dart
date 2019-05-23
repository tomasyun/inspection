import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/mine/updatepassword/action.dart';

import 'state.dart';

Widget buildView(
    UpdatePasswordState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '密码修改',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _buildContainer(null, '原密码', '请输入原密码', state.oldPasswordController),
            _buildContainer(EdgeInsets.only(top: 1.0), '新密码', '请输入新密码',
                state.newPasswordController),
            _buildContainer(EdgeInsets.only(top: 1.0), '确认密码', '请再次输入新密码',
                state.againPasswordController),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: _buildRaisedButton(dispatch: dispatch),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return RaisedButton(
      onPressed: () {
        dispatch(UpdatePasswordActionCreator.onUpdate());
      },
      child: Text(
        '确认修改',
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      color: Colors.blue,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 130.0, right: 130.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}

Widget _buildContainer(EdgeInsetsGeometry edge, String text, String hintText,
    TextEditingController controller) {
  return Container(
    margin: edge,
    color: Colors.white,
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          flex: 3,
        ),
        Expanded(
          child: TextField(
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            controller: controller,
            maxLines: 1,
            cursorColor: Colors.red,
            cursorWidth: 2.0,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
          flex: 8,
        )
      ],
    ),
  );
}
