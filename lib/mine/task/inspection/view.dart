import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/mine/task/inspection/action.dart';
import 'package:inspection/widget/state_view.dart' as stateView;
import 'package:inspection/widget/switch_button.dart';

import 'state.dart';

Widget buildView(
    InspectionTaskState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '检查内容',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
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
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    '火灾报警控制器',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
          ),
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
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    margin: EdgeInsets.only(top: 1),
    color: Colors.white,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Container(
          child: Text(
            content,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
        )),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: SwitchButton(
            isOpen: true,
            size: Size(60.0, 30.0),
            callback: () {
              dispatch(InspectionTaskActionCreator.onShowBottomSheet());
            },
          ),
        )
      ],
    ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 15.0),
    child: RaisedButton(
        onPressed: () {
          dispatch(InspectionTaskActionCreator.onSubmit());
        },
        child: Text(
          '提交',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        color: Colors.blue,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
  );
}
