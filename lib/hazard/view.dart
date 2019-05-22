import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/action.dart';
import 'package:inspection/widget/state_view.dart' as StateView;

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
                    margin: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
                    child: Text(
                      '时间查询',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _buildSearchItem(
                      label: '起始时间',
                      value: state.startDate,
                      callback: () {
                        dispatch(HazardActionCreator.onSelectStartDate());
                      }),
                  _buildSearchItem(
                      label: '结束时间',
                      value: state.endDate,
                      callback: () {
                        dispatch(HazardActionCreator.onSelectEndDate());
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                    child: Text(
                      '状态查询',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _buildSearchItem(
                      label: '隐患状态',
                      value: state.state,
                      callback: () {
                        dispatch(HazardActionCreator.onSelectState());
                      }),
                ],
              ),
            ),
          ),
          buildBottomNavigatorDouble(
              leftLabel: '查询',
              rightLabel: '重置',
              callbackLeftBtn: () {
                dispatch(HazardActionCreator.onResearch());
              },
              callbackRightBtn: () {
                dispatch(HazardActionCreator.onReset());
              }),
        ],
      ),
    ),
  );
}

Widget buildBottomNavigatorDouble(
    {String leftLabel = '',
    String rightLabel = '',
    VoidCallback callbackLeftBtn,
    VoidCallback callbackRightBtn}) {
  return Container(
    height: 60.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: callbackLeftBtn,
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.blue,
              height: double.infinity,
              child: Text(
                leftLabel,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: callbackRightBtn,
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.grey[200],
              height: double.infinity,
              child: Text(
                rightLabel,
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
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
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 30.0, right: 15.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 13.0, color: Colors.black45),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
