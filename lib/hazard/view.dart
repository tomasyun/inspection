import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HazardState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    key: state.scaffoldKey,
    appBar: AppBar(
      title: Text(
        '隐患记录',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            state.scaffoldKey.currentState.openEndDrawer();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            alignment: AlignmentDirectional.center,
            child: Text(
              '查询',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
          ),
        )
      ],
    ),
    body: ListView.builder(
      padding: EdgeInsets.only(bottom: 50.0),
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    ),
    endDrawer: Drawer(
      child: Container(),
    ),
  );
}
