import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/report/action.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'state.dart';

Widget buildView(
    HazardReportState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text(
        '隐患上报',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '位置',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: state.locationController,
                      keyboardType: TextInputType.text,
                      cursorWidth: 2.0,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: '隐患具体位置',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.camera_alt),
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
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '设备编号',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: state.deviceNoController,
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
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.camera_alt),
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
            GestureDetector(
              onTap: () {
                dispatch(HazardReportActionCreator.onLevelSkipFilter());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '等级',
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
                              state.levelRst,
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
                dispatch(HazardReportActionCreator.onTypeSkipFilter());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '类型',
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
                              state.typeRst,
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
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Text(
                '描述(200字以内)',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: TextField(
                controller: state.decsController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                maxLines: 10,
                cursorWidth: 1.0,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                decoration: InputDecoration(
                    hintText: "请输入隐患描述",
                    contentPadding: EdgeInsets.all(15.0),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '附件(最多可上传3张)',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                dispatch(HazardReportActionCreator.onAddAttachmentClick());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Icon(
                  Icons.add,
                  color: Colors.grey[100],
                  size: 80.0,
                ),
                width: 100.0,
                height: 100.0,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: _buildGridView(state: state),
              constraints: BoxConstraints.tightFor(
                  width: double.infinity,
                  height: state.assets.length > 0 ? 110.0 : 0.0),
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
  );
}

Widget _buildGridView({HazardReportState state}) {
  return GridView.count(
    crossAxisCount: 3,
    crossAxisSpacing: 5.0,
    children: List.generate(state.assets.length, (index) {
      Asset asset = state.assets[index];
      return AssetThumb(
        asset: asset,
        width: 100,
        height: 100,
      );
    }),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return RaisedButton(
      onPressed: () {
        dispatch(HazardReportActionCreator.onReport());
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
