import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/repair_record.dart';

Widget buildView(
    RepairRecord state, Dispatch dispatch, ViewService viewService) {
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
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                _buildItem(title: '进度状态 :', result: '${state.state}'),
                _buildItem(title: '设备名称 :', result: '${state.name}'),
                _buildItem(title: '故障描述 :', result: '${state.desc}'),
                _buildItem(title: '上报时间 :', result: '${state.date}'),
                _buildItem(title: '申请部门 :', result: '${state.depart}'),
                _buildItem(title: '申请人 :', result: '${state.applicant}')
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
