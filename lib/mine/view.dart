import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '个人中心',
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
      bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/ic_avatar.png',
                      //预览图
                      fit: BoxFit.cover,
                      width: 60.0,
                      height: 60.0,
                      image: '',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '张三',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          '生产部',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          '陕西缔科网络科技有限公司',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(130.0)),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildMineNavigatorItem(asset: 'images/ic_avatar.png', title: '我的任务'),
          _buildMineNavigatorItem(asset: 'images/ic_avatar.png', title: '我的上报'),
          _buildMineNavigatorItem(asset: 'images/ic_avatar.png', title: '我的整改'),
          _buildMineNavigatorItem(asset: 'images/ic_avatar.png', title: '我的复查'),
          _buildMineNavigatorItem(asset: 'images/ic_avatar.png', title: '密码修改'),
          _buildMineNavigatorItem(asset: 'images/ic_avatar.png', title: '版本更新'),
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
              Image.asset(
                asset,
                width: 40.0,
                height: 40.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(title),
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
