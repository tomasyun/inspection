import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/banner/banner.dart';
import 'package:inspection/global/marquee.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '首页',
        style: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              child: BannerWidget(
                entity: state.banners,
                delayTime: 500,
                duration: 1000,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[800],
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -9.0)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              width: double.infinity,
              height: 40.0,
              margin: EdgeInsets.only(top: 30.0),
              child: MarqueeText(
                '陕西缔科网络科技有限公司',
                speed: 10.0,
                gap: 100.0,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
