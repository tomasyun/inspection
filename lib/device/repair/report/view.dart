import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/repair/report/action.dart';

import 'state.dart';

Widget buildView(
    ReportState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '故障报修',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body:
//    WillPopScope(
//        child:
        SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '故障描述(200字以内)',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: state.controller,
                maxLength: 50,
                keyboardType: TextInputType.text,
                maxLines: 10,
                cursorWidth: 2.0,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                decoration: InputDecoration(
                    hintText: "请输入故障描述",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.5))),
              ),
            ),
            GestureDetector(
              onTap: () {
                dispatch(ReportActionCreator.onDepartSkipFilter());
              },
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '选择责任部门',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        state.departRst,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.lightBlue),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                dispatch(ReportActionCreator.onApplicantSkipFilter());
              },
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '申请人',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        state.applicantRst,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.lightBlue),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 50.0),
              child: _buildRaisedButton(dispatch: dispatch),
            )
          ],
        ),
      ),
    ),
//        onWillPop: () {
//          dispatch(ReportActionCreator.onGoBack());
//        }
//        ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return RaisedButton(
      onPressed: () {
        dispatch(ReportActionCreator.onReport());
      },
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
