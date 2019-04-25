import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '个人中心',
        style: TextStyle(fontSize: 18.0),
      ),
      leading: Icon(Icons.arrow_back),
      backgroundColor: Colors.blue,
      centerTitle: true,
      bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: 30.0, bottom: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/ic_avatar.png',
                      //预览图
                      fit: BoxFit.fitWidth,
                      image: '',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
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
          preferredSize: Size.fromHeight(200.0)),
    ),
    body: SingleChildScrollView(),
  );
}
