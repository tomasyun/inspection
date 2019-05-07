import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/widget/switch_button.dart';

import 'state.dart';

Widget buildView(
    InspectionTaskState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '检查内容',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: _buildAllTaskList(state.tasks),
      ),
    ),
  );
}

List<Widget> _buildAllTaskList(List<String> list) {
  return list.map((item) {
    return _buildInspectionTaskItem(item);
  }).toList();
}

Widget _buildInspectionTaskItem(String content) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    width: double.infinity,
    child: Row(
      children: <Widget>[
        Container(
          child: Text(
            content,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                    '正常',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                ),
                SwitchButton(
                  isOpen: true,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '异常',
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ))
              ],
            ),
          ),
        )
      ],
    ),
  );
}
