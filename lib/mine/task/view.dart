import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(TaskState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '代办任务',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: Container(
      child: stateView.blackPage(),
    ),
  );
}
