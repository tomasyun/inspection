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
        '维修上报',
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
        padding: EdgeInsets.only(bottom: 60.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '设备名称',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: state.deviceNoController,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      cursorWidth: 2.0,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: "手输/扫码",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        'images/ic_scan_small.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.black45,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '编号',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: state.deviceNoController,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      cursorWidth: 2.0,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: '扫码获取',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.black45,
            ),
            GestureDetector(
              onTap: () {
                dispatch(ReportActionCreator.onDepartSkipFilter());
              },
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '责任人',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              state.departRst,
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.red),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.black45,
            ),
            GestureDetector(
              onTap: () {
                dispatch(ReportActionCreator.onDepartSkipFilter());
              },
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '责任部门',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              state.departRst,
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.red),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.black45,
            ),
            GestureDetector(
              onTap: () {
                dispatch(ReportActionCreator.onRepairManSkipFilter());
              },
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '维修人',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              state.applicantRst,
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.red),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.black45,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '维修时间',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(
                              state.applicantRst,
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.red),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
              color: Colors.white,
              child: TextField(
                controller: state.descController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                maxLines: 10,
                cursorWidth: 2.0,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                decoration: InputDecoration(
                    hintText: "请输入故障描述",
                    contentPadding: EdgeInsets.all(15.0),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
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
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      color: Colors.blue,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 150.0, right: 150.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}
