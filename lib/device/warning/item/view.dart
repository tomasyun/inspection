import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/warning_model.dart';

Widget buildView(
    WarningModel state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
//      dispatch(RecordItemActionCreator.onAction());
    },
    child: Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                _buildItem(title: '紧急程度 :', result: '${state.level}'),
                _buildItem(title: '设备名称 :', result: '${state.deviceName}'),
                _buildItem(title: '预警原因 :', result: '${state.reason}'),
                _buildItem(title: '责任部门 :', result: '${state.depart}'),
                _buildItem(title: '责任人 :', result: '${state.pic}'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildItem({String title, String result}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(),
          flex: 1,
        ),
        Expanded(
          child: Text(
            result,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.left,
          ),
          flex: 7,
        )
      ],
    ),
  );
}
