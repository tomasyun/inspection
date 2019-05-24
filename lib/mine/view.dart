import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/mine/action.dart';

import 'state.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '我的',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            dispatch(MineActionCreator.onSkipSetting());
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                        placeholder: 'images/ic_avatar.png',
                        //预览图
                        fit: BoxFit.cover,
                        width: 60.0,
                        height: 60.0,
                        image: '',
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                state.map['userName'],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                state.map['company'],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () {
                        dispatch(MineActionCreator.onSkipUserInfo());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Text(
                          '基本信息',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          GestureDetector(
            onTap: () {
              dispatch(MineActionCreator.onSkipMineTask());
            },
            child: _buildMineNavigatorItem(
                asset: 'images/ic_todo_task.png', title: '代办任务'),
          ),

//          GestureDetector(
//            onTap: () {
//              dispatch(MineActionCreator.onSkipMineReport());
//            },
//            child: _buildMineNavigatorItem(
//                asset: 'images/ic_mine_report.png', title: '上报记录'),
//          ),
          GestureDetector(
            onTap: () {
              dispatch(MineActionCreator.onSkipHazardHistory());
            },
            child: _buildMineNavigatorItem(
                asset: 'images/ic_history_hazard.png', title: '历史隐患'),
          ),
          GestureDetector(
            onTap: () {
              dispatch(MineActionCreator.onUpdatePasswordAction());
            },
            child: _buildMineNavigatorItem(
                asset: 'images/ic_pwd_update.png', title: '修改密码'),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMineNavigatorItem({String asset, String title}) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  asset,
                  width: 45.0,
                  height: 45.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
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
