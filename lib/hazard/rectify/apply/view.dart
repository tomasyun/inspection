import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/rectify/apply/action.dart';

import 'state.dart';

Widget buildView(
    CostApplyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '整改费用申请',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '整改金额',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: state.costController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    cursorWidth: 2.0,
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: '请填写',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '申请说明(200字以内)',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: TextField(
              controller: state.decsController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              maxLines: 6,
              cursorWidth: 1.0,
              cursorColor: Colors.grey,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              decoration: InputDecoration(
                  hintText: '填写申请说明',
                  contentPadding: EdgeInsets.all(15.0),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(top: 150.0),
            child: _buildRaisedButton(dispatch: dispatch),
          )
        ],
      ),
    ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 15.0),
    child: RaisedButton(
        onPressed: () {
          dispatch(CostApplyActionCreator.onReport());
        },
        child: Text(
          '上报',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        color: Colors.blue,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
  );
}
