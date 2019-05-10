import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/action.dart';

import 'state.dart';

Widget buildView(
    HazardState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    key: state.scaffoldKey,
    appBar: AppBar(
      title: Text(
        '隐患管理',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            state.scaffoldKey.currentState.openEndDrawer();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            alignment: AlignmentDirectional.center,
            child: Text(
              '查询',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        )
      ],
    ),
    body: ListView.builder(
      padding: EdgeInsets.only(bottom: 50.0),
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    ),
    endDrawer: Drawer(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            height: double.infinity,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                    child: Text(
                      '按隐患发现时间查询',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildSearchItem(
                      label: '起始时间',
                      value: '',
                      callback: () {
                        dispatch(HazardActionCreator.onSelectDate());
                      }),
                  _buildSearchItem(
                      label: '结束时间',
                      value: '',
                      callback: () {
                        dispatch(HazardActionCreator.onSelectDate());
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                    child: Text(
                      '按隐患状态查询',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildSearchItem(
                      label: '隐患状态',
                      value: '',
                      callback: () {
                        dispatch(HazardActionCreator.onSelectState());
                      }),
                ],
              ),
            ),
          ),
          buildBottomNavigatorDouble(title1: '查询', title2: '重置'),
        ],
      ),
    ),
  );
}

Widget buildBottomNavigatorDouble(
    {String title1 = '',
    String title2 = '',
    GestureTapCallback callback1,
    GestureTapCallback callback2}) {
  return Container(
    height: 60.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: callback1,
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.blue,
              height: double.infinity,
              child: Text(
                title1,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: callback2,
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.grey,
              height: double.infinity,
              child: Text(
                title2,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildSearchItem({String label, String value, VoidCallback callback}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              label,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              value,
              style: TextStyle(fontSize: 13.0, color: Colors.lightBlue),
            ),
          ),
          Container(
            child: Expanded(
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
