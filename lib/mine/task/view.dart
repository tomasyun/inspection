import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/todos_model.dart';

import 'state.dart';

Widget buildView(TaskState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '代办任务',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Column(
          children: _buildToDoWidgets(dispatch, state.model),
        ),
      ),
    ),
  );
}

List<Widget> _buildToDoWidgets(Dispatch dispatch, ToDosModel model) {
  List<Widget> list = [];
  model.rectify.map((rectify) {
    list.add(_rectify(rectify));
  }).toList();

  model.recheck.map((recheck) {
    list.add(_recheck(recheck));
  }).toList();

  model.keep.map((keep) {
    list.add(_keep(keep));
  }).toList();

  model.inspect.map((inspect) {
    list.add(_inspect(inspect, dispatch));
  }).toList();
  return list;
}

Widget _recheck(Recheck recheck) {
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
                _buildItem(title: '隐患描述 :', result: '${recheck.desc}'),
                _buildItem(title: '责任部门 :', result: '${recheck.depart}'),
                _buildItem(title: '复查时间 :', result: '${recheck.date}'),
                _buildItem(title: '复查人 :', result: '${recheck.rechecker}'),
                _buildItem(title: '隐患状态 :', result: '${recheck.state}'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _rectify(Rectify rectify) {
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
                _buildItem(title: '隐患描述 :', result: '${rectify.desc}'),
                _buildItem(title: '责任部门 :', result: '${rectify.depart}'),
                _buildItem(title: '发现时间 :', result: '${rectify.date}'),
                _buildItem(title: '隐患状态 :', result: '${rectify.state}'),
                _buildItem(title: '整改人 :', result: '${rectify.rectifier}'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _keep(Keep keep) {
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
                _buildItem(title: '保养时间 :', result: '${keep.date}'),
                _buildItem(title: '保养人 :', result: '${keep.keeper}'),
                _buildItem(title: '保养状态 :', result: '${keep.state}'),
                _buildItem(title: '备注 :', result: '${keep.remark}'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _inspect(Inspect inspect, Dispatch dispatch) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
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
                    _buildItem(title: '设备名称 :', result: '${inspect.name}'),
                    _buildItem(title: '责任人 :', result: '${inspect.pic}'),
                    _buildItem(title: '责任部门 :', result: '${inspect.depart}'),
                    _buildItem(title: '状态 :', result: '${inspect.state}'),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          color: Colors.blue,
          width: double.infinity,
          height: 50.0,
          child: Text(
            '去扫码',
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        )
      ],
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
