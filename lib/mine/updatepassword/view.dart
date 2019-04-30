import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    UpdatePasswordState state, Dispatch dispatch, ViewService viewService) {
  return UpdatePasswordPageWidget();
}

class UpdatePasswordPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UpdatePasswordPageState();
}

class UpdatePasswordPageState extends State<UpdatePasswordPageWidget> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _againPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '密码修改',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildContainer(null, '原密码', '请输入原密码', _oldPasswordController),
            _buildContainer(EdgeInsets.only(top: 1.0), '新密码', '请输入新密码',
                _newPasswordController),
            _buildContainer(EdgeInsets.only(top: 1.0), '确认密码', '请再次输入新密码',
                _againPasswordController),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: _buildRaisedButton(),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildRaisedButton() {
  return RaisedButton(
      onPressed: () {},
      child: Text(
        '确认修改',
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      color: Colors.white,
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
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
          flex: 3,
        ),
        Expanded(
          child: TextField(
            style: TextStyle(fontSize: 14.0),
            controller: controller,
            maxLines: 1,
            cursorColor: Colors.red,
            cursorWidth: 3.0,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
          ),
          flex: 8,
        )
      ],
    ),
  );
}
