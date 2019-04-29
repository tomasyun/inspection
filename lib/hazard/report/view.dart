import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HazardReportState state, Dispatch dispatch, ViewService viewService) {
  return HazardReportPage();
}

class HazardReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HazardReportS();
}

class HazardReportS extends State<HazardReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          '隐患上报',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        '设备编号',
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
              Container(
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
              Container(
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
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  maxLines: 10,
                  cursorWidth: 2.0,
                  cursorColor: Colors.grey,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "",
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
            ],
          ),
        ),
      ),
    );
  }
}
