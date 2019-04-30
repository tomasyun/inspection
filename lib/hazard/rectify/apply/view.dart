import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    CostApplyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '整改费用申请',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Text(
                    '整改金额',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    cursorWidth: 2.0,
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: "请输入整改所需费用金额",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text('万元'),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '申请费用说明(200字以内)',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: TextField(
              maxLength: 50,
              keyboardType: TextInputType.text,
              maxLines: 6,
              cursorWidth: 2.0,
              cursorColor: Colors.grey,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              decoration: InputDecoration(
                  hintText: "请输入费用申请缘由",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5))),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(top: 50.0),
            child: _buildRaisedButton(),
          )
        ],
      ),
    ),
  );
}

Widget _buildRaisedButton() {
  return RaisedButton(
      onPressed: () {},
      child: Text(
        '提交',
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      color: Colors.white,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 150.0, right: 150.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}
