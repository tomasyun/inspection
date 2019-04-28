import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/recheck/report/state.dart';

Widget buildView(
    RecheckReportState state, Dispatch dispatch, ViewService viewService) {
  return RecheckReportPage();
}

class RecheckReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecheckReportS();
}

class RecheckReportS extends State<RecheckReportPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          '隐患复查',
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
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '复查情况(200字以内)',
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
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '复查意见',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
