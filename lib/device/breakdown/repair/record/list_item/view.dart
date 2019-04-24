import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/repair_record.dart';

Widget buildView(
    RepairRecItem state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
//      dispatch(RecordActionCreator.onAction());
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
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _buildItem(title: '进度状态:', result: '${state.state}'),
                _buildItem(title: '设备名称:', result: '${state.name}'),
                _buildItem(title: '故障描述:', result: '${state.desc}'),
                _buildItem(title: '上报时间:', result: '${state.date}'),
                _buildItem(title: '申请部门:', result: '${state.depart}'),
                _buildItem(title: '申请人:', result: '${state.applyer}')
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
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0),
          child: Text(
            result,
            style: TextStyle(fontSize: 14),
          ),
        )
      ],
    ),
  );
}
