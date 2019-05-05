import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(KeepState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '保养记录',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: Container(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 50.0),
        itemBuilder: listAdapter.itemBuilder,
        itemCount: listAdapter.itemCount,
      ),
    ),
  );

//  return Container(
//    child: ListView.builder(
//      padding: EdgeInsets.only(bottom: 50.0),
//      itemBuilder: listAdapter.itemBuilder,
//      itemCount: listAdapter.itemCount,
//    ),
//  );
}
