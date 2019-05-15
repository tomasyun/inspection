import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/charts/simple_line_chart.dart';

import 'state.dart';

Widget buildView(
    SaveAnalyseState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '安全分析',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Padding(
      padding: EdgeInsets.all(15.0),
      child: SizedBox(
        height: 250.0,
        child: SimpleLineChart.withRandomData(),
      ),
    ),
  );
}
