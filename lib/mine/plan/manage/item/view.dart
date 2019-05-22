import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/plan_model.dart';

Widget buildView(Data data, Dispatch dispatch, ViewService viewService) {
  Map<String, dynamic> map = Map();
  if (data.planStatus == '0') {
    map['state'] = '未开始';
  } else if (data.planStatus == '1') {
    map['state'] = '进行中';
  } else if (data.planStatus == '2') {
    map['state'] = '已结束';
  }
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10.0),
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
      child: Column(
        children: <Widget>[
          _buildItemHeader(
              title: '${data.planName}', result: '${map['state']}'),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            color: Colors.black12,
            height: 0.5,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    _buildItem(title: '计划编号', result: '${data.planCode}'),
                    _buildItem(title: '责任人', result: '${data.planPerson}'),
                    _buildItem(
                        title: '责任部门', result: '${data.planOrganization}'),
                    _buildItem(title: '开始时间', result: '${data.beginDate}'),
                    _buildItem(title: '结束时间', result: '${data.endDate}'),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    ),
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
              textAlign: TextAlign.left,
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
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
      crossAxisAlignment: CrossAxisAlignment.end,
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
        ),
        Container(
            alignment: AlignmentDirectional.topEnd,
            child: _buildChangeTextColor(result))
      ],
    ),
  );
}

Widget _buildChangeTextColor(String title) {
  if (title == '未开始') {
    return Text(title,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ));
  } else if (title == '进行中') {
    return Text(title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ));
  } else if (title == '已结束') {
    return Text(title,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ));
  } else {
    return Text(title,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ));
  }
}
