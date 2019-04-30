import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    FilterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
      child: Column(
        children: <Widget>[
          Container(
            child: _buildFilterTitle(flag: state.flag),
          )
        ],
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
