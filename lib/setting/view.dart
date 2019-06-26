import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/setting/action.dart';

import 'state.dart';

Widget buildView(
  SettingState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '设置',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Container(
      child: Column(
        children: <Widget>[
//          GestureDetector(
//            onTap: () {
//              dispatch(SettingActionCreator.onSkipUpgradePassword());
//            },
//            child: _buildMineNavigatorItem(
//                asset: 'images/ic_pwd_update.png', title: '修改密码'),
//          ),
          GestureDetector(
            onTap: () {
              dispatch(SettingActionCreator.onUpgradeVersion());
            },
            child: _buildMineNavigatorItem(
                asset: 'images/ic_version_update.png',
                title: '检查版本',
                edge: EdgeInsets.only(top: 10.0)),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.0),
            child: _buildRaisedButton(dispatch: dispatch),
          )
        ],
      ),
    ),
  );
}

Widget _buildMineNavigatorItem(
    {String asset, String title, EdgeInsetsGeometry edge}) {
  return Container(
    margin: edge,
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                asset,
                width: 40.0,
                height: 40.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black45,
                  ),
                ),
                flex: 1,
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.black12,
        )
      ],
    ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    child: RaisedButton(
        onPressed: () {
          dispatch(SettingActionCreator.onLogout());
        },
        child: Text(
          '退出登录',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        color: Colors.blue,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
  );
}
