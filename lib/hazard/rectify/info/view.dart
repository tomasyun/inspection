import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    RectifyInfoState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '整改信息',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Text(
              '整改情况',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            color: Colors.white,
            child: Text(
              '西安市高新区丈八一路汇鑫IBC B座1005,办公室墙面重新打底粉刷',
              style: TextStyle(
                  fontSize: 14.0, color: Colors.black, letterSpacing: 2),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '整改附件',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            color: Colors.white,
            child: _buildGridView(),
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 130.0),
          ),
          _buildHazardInfoItem(title: '整改人', content: '高大陆'),
          _buildHazardInfoItem(title: '负责部门', content: '陕西缔科网络科技有限公司'),
        ],
      ),
    ),
  );
}

Widget _buildHazardInfoItem({String title, String content}) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.all(15.0),
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
