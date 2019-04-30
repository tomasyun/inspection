import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    ReportState state, Dispatch dispatch, ViewService viewService) {
  return RepairReportPage();
}

class RepairReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RepairReportState();
}

class RepairReportState extends State<RepairReportPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          '故障报修',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                  controller: _controller,
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
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(top: 50.0),
                child: _buildRaisedButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
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
