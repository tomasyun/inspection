import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    RectifyReportState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '整改上报',
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
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '整改情况(200字以内)',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                maxLines: 6,
                cursorWidth: 2.0,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                decoration: InputDecoration(
                    hintText: "请输入复查情况",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.5))),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '整改附件(最多可上传3张)',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Icon(
                Icons.add,
                color: Colors.grey[100],
                size: 80.0,
              ),
              width: 100.0,
              height: 100.0,
              color: Colors.grey,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 50.0),
              child: _buildRaisedButton(),
            )
          ],
        )),
  );
}

Widget _buildRaisedButton() {
  return RaisedButton(
      onPressed: () {},
      child: Text(
        '上报',
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      color: Colors.white,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 150.0, right: 150.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}
