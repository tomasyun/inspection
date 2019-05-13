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
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[800],
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
                spreadRadius: -7.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildItemHeader(title: '火灾报警控制器', result: '已维修'),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                color: Colors.black12,
                height: 0.5,
              ),
              _buildItem(title: '设备名称', result: '${state.name}'),
              _buildItem(title: '位置', result: '${state.name}'),
              _buildItem(title: '编号', result: '${state.name}'),
              _buildItem(title: '故障描述', result: '${state.desc}'),
              _buildItem(title: '上报时间', result: '${state.date}'),
              _buildItem(title: '责任部门', result: '${state.depart}'),
              _buildItem(title: '上报人', result: '${state.applicant}')
            ],
          ),
        )),
  );
}

Widget _buildItem({String title, String result}) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Text(
              result,
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 7,
        ),
      ],
    ),
  );
}

Widget _buildItemHeader({String title, String result}) {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0),
              maxLines: 1,
            ),
          ),
          flex: 4,
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              result,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          flex: 6,
        )
      ],
    ),
  );
}
