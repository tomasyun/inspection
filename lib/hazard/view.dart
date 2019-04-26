import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HazardState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '隐患',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: ListView.builder(
      padding: EdgeInsets.only(bottom: 50.0),
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    ),
  );
}
