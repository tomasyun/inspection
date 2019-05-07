import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/mine/task/inspection/action.dart';
import 'package:inspection/widget/state_view.dart' as stateView;
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
    body: _buildInspectionTaskBody(dispatch, state),
  );
}

Widget _buildInspectionTaskBody(Dispatch dispatch, InspectionTaskState state) {
  if (state.tasks.isEmpty) {
    return Container(
      child: stateView.blackPage(),
    );
  } else {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: _buildAllTaskList(dispatch, state.tasks),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(top: 50.0),
                child: _buildRaisedButton(dispatch: dispatch),
              )
            ],
          )),
    );
  }
}

List<Widget> _buildAllTaskList(Dispatch dispatch, List<String> list) {
  return list.map((item) {
    return _buildInspectionTaskItem(dispatch, item);
  }).toList();
}

Widget _buildInspectionTaskItem(Dispatch dispatch, String content) {
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
                  callback: () {
                    dispatch(InspectionTaskActionCreator.onShowBottomSheet());
                  },
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
        ),
      ],
    ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return RaisedButton(
      onPressed: () {
        dispatch(InspectionTaskActionCreator.onSubmit());
      },
      child: Text(
        '提交',
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      color: Colors.white,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 150.0, right: 150.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));
}
