import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/widget/state_view.dart' as StateView;

import 'state.dart';

Widget buildView(
  HazardHistoryState state,
  Dispatch dispatch,
  ViewService viewService,
) {
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
    body: listAdapter.itemCount != 0
        ? Container(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 50.0),
              itemBuilder: listAdapter.itemBuilder,
              itemCount: listAdapter.itemCount,
            ),
            margin: EdgeInsets.all(15.0),
          )
        : Container(
            child: StateView.blackPage(),
          ),
  );
}
