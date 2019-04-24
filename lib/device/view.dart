import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/info/page.dart';
import 'package:inspection/device/keep/page.dart';
import 'package:inspection/device/repair/record/page.dart';

import 'state.dart';

Widget buildView(
    DeviceState state, Dispatch dispatch, ViewService viewService) {
  return DevicePageWidget();
}

class DevicePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DevicePageState();
}

class DevicePageState extends State<DevicePageWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备信息'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "设备信息",
            ),
            Tab(
              text: "维修记录",
            ),
            Tab(
              text: "保养记录",
            )
          ],
          controller: _controller,
          labelColor: Colors.white,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: <Widget>[
            InfoPage().buildPage(null),
            RecordPage().buildPage(null),
            KeepPage().buildPage(null)
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
