import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/report/action.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'state.dart';

Widget buildView(
    HazardReportState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
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
        padding:
            EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0, bottom: 50.0),
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
                      '设备编号',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: state.deviceNoController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      cursorWidth: 2.0,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        hintText: "在此手动输入设备编号",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Icon(Icons.camera_alt),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '隐患位置',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: state.locationController,
                      keyboardType: TextInputType.text,
                      cursorWidth: 2.0,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        hintText: "隐患具体位置",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                dispatch(HazardReportActionCreator.onLevelSkipFilter());
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
                        '隐患等级',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        state.levelRst,
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
                dispatch(HazardReportActionCreator.onTypeSkipFilter());
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
                        '隐患类型',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        state.typeRst,
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
              margin: EdgeInsets.only(top: 30.0),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '隐患描述(200字以内)',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: state.decsController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                maxLines: 10,
                cursorWidth: 2.0,
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                decoration: InputDecoration(
                    hintText: "请输入隐患描述",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.5))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                '复查附件(最多可上传3张)',
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
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
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
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      color: Colors.white,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 150.0, right: 150.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}
