import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HazardHistoryState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '历史隐患',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 50.0),
          itemBuilder: listAdapter.itemBuilder,
          itemCount: listAdapter.itemCount,
        )),
  );
}
