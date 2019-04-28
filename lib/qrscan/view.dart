import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/info/page.dart';
import 'package:inspection/device/keep/page.dart';
import 'package:inspection/device/repair/record/page.dart';
import 'package:inspection/qrscan/action.dart';

import 'state.dart';

Widget buildView(
    QRScanState state, Dispatch dispatch, ViewService viewService) {
  if (state.result == null) {
    return buildPrimaryScaffold(state, dispatch);
  } else {
    return DevicePageWidget();
  }
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
        leading: Container(),
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

Widget buildPrimaryScaffold(QRScanState state, Dispatch dispatch) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '扫码',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              dispatch(QRScanActionCreator.onFunctionScanQRCode());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/ic_avatar.png',
                    width: 60.0,
                    height: 60.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '扫一扫',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            '对准设备的二维码',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            width: double.infinity,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/ic_avatar.png',
                  width: 60.0,
                  height: 60.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '输入编号',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(
                          '手动输入设备编号',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
