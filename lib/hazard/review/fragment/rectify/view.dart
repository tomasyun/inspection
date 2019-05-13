import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    RectifyInfoFragState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.grey[100],
    child: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  blurRadius: 10.0,
                  offset: Offset(0.0, 3.0),
                  spreadRadius: -7.0),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                '整改描述',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                '西安市高新区丈八一路汇鑫IBC B座1005,办公室墙面重新打底粉刷',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            _buildHazardInfoItem(title: '整改人', content: '黄骁'),
            _buildHazardInfoItem(title: '整改时间', content: '2019-09-08'),
            _buildHazardInfoItem(title: '整改费用', content: '无'),
            _buildHazardInfoItem(title: '复查人', content: '高大陆'),
            _buildHazardInfoItem(title: '复查时间', content: '2019-06-08'),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '整改附件',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: _buildGridView(),
              constraints:
                  BoxConstraints.tightFor(width: double.infinity, height: 90.0),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHazardInfoItem({String title, String content}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
          flex: 7,
        )
      ],
    ),
  );
}

Widget _buildAttachment() {
  return Container(
    child: Icon(
      Icons.add,
      color: Colors.grey[100],
      size: 80.0,
    ),
    height: 100.0,
    color: Colors.grey,
  );
}

Widget _buildGridView() {
  List<Widget> list = [
    _buildAttachment(),
    _buildAttachment(),
    _buildAttachment(),
    _buildAttachment()
  ];
  return GridView.count(
    crossAxisCount: 3,
    children: list,
    crossAxisSpacing: 5.0,
    physics: NeverScrollableScrollPhysics(),
  );
}
