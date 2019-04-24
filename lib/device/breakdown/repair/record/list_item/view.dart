import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/repair_record.dart';

Widget buildView(
    RepairRecItem state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('进度状态:'),
                ),
                Container(
                  child: Text('${state.state}'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('设备名称:'),
                ),
                Container(
                  child: Text('${state.name}'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('故障描述:'),
                ),
                Container(
                  child: Text('${state.desc}'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('上报时间:'),
                ),
                Container(
                  child: Text('${state.date}'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('申请部门:'),
                ),
                Container(
                  child: Text('${state.depart}'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('申请人:'),
                ),
                Container(
                  child: Text('${state.applyer}'),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
