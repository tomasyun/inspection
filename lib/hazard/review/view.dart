import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/review/fragment/hazard/page.dart';
import 'package:inspection/hazard/review/fragment/rectify/page.dart';
import 'package:inspection/hazard/review/fragment/review/page.dart';

import 'state.dart';

Widget buildView(
    ReviewState state, Dispatch dispatch, ViewService viewService) {
  return ReviewPageWidget();
}

class ReviewPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewPageState();
}

class ReviewPageState extends State<ReviewPageWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '隐患查看',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: '隐患信息',
            ),
            Tab(
              text: '整改信息',
            ),
            Tab(
              text: '复查信息',
            )
          ],
          controller: _controller,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: <Widget>[
            HazardInfoFragPage().buildPage(null),
            RectifyInfoFragPage().buildPage(null),
            ReviewInfoFragPage().buildPage(null)
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
