import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/function/action.dart';

import 'state.dart';

Widget buildView(
    FunctionState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text(
        '功能',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      dispatch(FunctionActionCreator.onDeviceScanQRCode());
                    },
                    child: _buildFuncItem(
                        asset: 'images/ic_avatar.png', title: '设备信息'),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(FunctionActionCreator.onDeviceWarning());
                    },
                    child: _buildFuncItem(
                        asset: 'images/ic_dev_warning.png', title: '设备预警'),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(FunctionActionCreator.onHazardReview());
                    },
                    child: _buildFuncItem(
                        asset: 'images/ic_hazard_review.png', title: '隐患管理'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      dispatch(FunctionActionCreator.onInspectionPlan());
                    },
                    child: _buildFuncItem(
                        asset: 'images/ic_plan_review.png', title: '计划查询'),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildFuncItem(
                        asset: 'images/ic_mine_plan.png', title: '我的计划'),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildFuncItem(
                        asset: 'images/ic_safe_analyse.png', title: '安全分析'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//Widget _buildLabel({String label}) {
//  return Container(
//    margin: EdgeInsets.only(top: 30.0),
//    child: Text(
//      label,
//      style: TextStyle(
//          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
//    ),
//  );
//}

Widget _buildFuncItem({String asset, String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Image.asset(
        asset,
        width: 60.0,
        height: 60.0,
      ),
      Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 13.0, color: Colors.black),
        ),
      )
    ],
  );
}
