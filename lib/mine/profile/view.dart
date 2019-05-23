import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    ProfileState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '个人信息',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          _buildContainer(
              title1: '用户名',
              title2: state.model != null && state.model.data != null
                  ? '${state.model.data.userName}'
                  : '',
              maxLines: 2),
          _buildContainer(
              edge: EdgeInsets.only(top: 10.0),
              title1: '姓名',
              title2: state.model != null ? '${state.model.data.name}' : '',
              maxLines: 2),
          _buildContainer(
              edge: EdgeInsets.only(top: 10.0),
              title1: '所在单位',
              title2: state.model != null && state.model.data != null
                  ? '${state.model.data.company}'
                  : '',
              maxLines: 2),
          _buildContainer(
              edge: EdgeInsets.only(top: 10.0),
              title1: '所在部门',
              title2: state.model != null && state.model.data != null
                  ? '${state.model.data.organization}'
                  : '',
              maxLines: 2),
        ],
      ),
    ),
  );
}

Widget _buildContainer(
    {EdgeInsetsGeometry edge, String title1, String title2, int maxLines}) {
  return Container(
    margin: edge,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            title1,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(
            title2,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
            maxLines: maxLines,
          ),
        )
      ],
    ),
  );
}
