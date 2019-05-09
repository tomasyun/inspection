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
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[800],
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
                spreadRadius: -9.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildItem(title: '紧急程度 :', result: '${state.level}'),
              _buildItem(title: '设备名称 :', result: '${state.deviceName}'),
              _buildItem(title: '预警原因 :', result: '${state.reason}'),
              _buildItem(title: '责任部门 :', result: '${state.depart}'),
              _buildItem(title: '责任人 :', result: '${state.pic}'),
            ],
          ),
        )),
  );
}

Widget _buildItem({String title, String result}) {
  return Container(
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
          flex: 3,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Text(
              result,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 7,
        )
      ],
    ),
  );
}
