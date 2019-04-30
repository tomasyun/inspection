import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/widget/filter_flow_delegate.dart';

import 'state.dart';

Widget buildView(
    FilterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: _buildFilterTitle(flag: state.flag),
      leading: Container(),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 150.0),
      child: Flow(
        delegate: FilterFlowDelegate(EdgeInsets.all(5.0)),
        children: _buildFlowData(state.levels),
      ),
    ),
  );
}

Widget _buildFilterTitle({String flag, String content = ''}) {
  if (flag == 'level') {
    content = '隐患等级';
  } else if (flag == 'type') {
    content = '隐患类型';
  }
  return Text(
    content,
    style: TextStyle(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
  );
}

Widget _buildFlowItem(String item) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 50.0,
      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            item,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

List<Widget> _buildFlowData(List<String> list) {
  return list.map((item) => _buildFlowItem(item)).toList();
}
