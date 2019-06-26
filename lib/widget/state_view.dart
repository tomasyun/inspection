import 'package:flutter/material.dart';

Widget blackPage() {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            'images/ic_blank.png',
            width: 150.0,
            height: 250.0,
          ),
        ),
        Container(
          child: Text(
            '抱歉!没有相关数据...',
            style: TextStyle(
                fontSize: 15.0, color: Colors.black, letterSpacing: 2.0),
          ),
        )
      ],
    ),
  );
}

Widget preLoadPage() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget netMissPage() {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            'images/ic_net_miss.png',
            width: 150.0,
            height: 250.0,
          ),
        ),
        Container(
          child: Text(
            '连接失败,请查看相关网络设置...',
            style: TextStyle(
                fontSize: 15.0, color: Colors.black, letterSpacing: 2.0),
          ),
        )
      ],
    ),
  );
}
