import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/info/action.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(InfoState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '设备信息',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        buildBottomNavigator(dispatch),
        Container(
          height: double.infinity,
          padding: EdgeInsets.only(bottom: 60),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 60),
              child: stateView.blackPage(),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBottomNavigator(Dispatch dispatch) {
  return Container(
    height: 60.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              dispatch(InfoActionCreator.onSkipRepairRecord());
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.blue,
              height: double.infinity,
              child: Text(
                '维修记录',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              dispatch(InfoActionCreator.onSkipKeepRecord());
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.grey,
              height: double.infinity,
              child: Text(
                '保养记录',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
