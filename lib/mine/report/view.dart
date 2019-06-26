import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(
  ReportRecordState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '上报记录',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Container(
      child: stateView.blackPage(),
    ),
  );
}
