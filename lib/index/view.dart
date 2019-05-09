import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/nav_item.dart';
import 'package:inspection/function/page.dart';
import 'package:inspection/global/index_will_pop.dart';
import 'package:inspection/home/page.dart';
import 'package:inspection/mine/page.dart';

import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return IndexPageWidget();
}

class IndexPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPageWidget>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  var tabImages;

  /*
   * 存储的四个页面，和Fragment一样
   */
  var _list = <Widget>[
    HomePage().buildPage(null),
//    DevicePage().buildPage(null),
    FunctionPage().buildPage(null),
//    QRScanPage().buildPage(null),
    MinePage().buildPage(null)
  ];

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Widget getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: tabImages[curIndex][1],
        width: 28.0,
        height: 28.0,
      );
    }
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: tabImages[curIndex][0],
      width: 28.0,
      height: 28.0,
    );
  }

  void initIcon() {
    tabImages = [
      [
        getTabImage("images/ic_home_normal.png"),
        getTabImage("images/ic_home_press.png")
      ],
      [
        getTabImage("images/ic_fun_normal.png"),
        getTabImage("images/ic_fun_press.png")
      ],
//      [
//        getTabImage("images/ic_home_normal.png"),
//        getTabImage("images/ic_home_press.png")
//      ],
      [
        getTabImage("images/ic_mine_normal.png"),
        getTabImage("images/ic_mine_press.png")
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    initIcon();
    var bottomNavigationBar = new BottomNavigationBar(
      items: <NavItem>[
        NavItem(
          icon: getTabIcon(0),
          title: Text(
            '首页',
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          vsync: this,
        ),
        NavItem(
          icon: getTabIcon(1),
          title: Text(
            '功能',
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          vsync: this,
        ),
//          NavItem(
//            icon: getTabIcon(2),
//            title: Text('扫码'),
//            vsync: this,
//          ),
        NavItem(
          icon: getTabIcon(2),
          title: Text(
            '我的',
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          vsync: this,
        ),
      ].map((item) => item.item).toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.red,
      //设置显示的模式
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return IndexWillPop(
      child: Scaffold(
        body: Center(child: _list[_currentIndex]),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
