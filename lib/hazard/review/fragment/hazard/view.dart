import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HazardInfoFragState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.grey[100],
    child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 60),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  blurRadius: 10.0,
                  offset: Offset(0.0, 3.0),
                  spreadRadius: -7.0),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                '隐患描述',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '西安市高新区丈八一路汇鑫IBC B座1005,办公室墙面墙皮脱落',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            _buildHazardInfoItem(title: '位置', content: '西安市高新区丈八一路汇鑫IBC'),
            _buildHazardInfoItem(title: '编号', content: '001'),
            _buildHazardInfoItem(title: '责任部门', content: '陕西缔科网络科技有限公司'),
            _buildHazardInfoItem(title: '责任人', content: '贠拓'),
            _buildHazardInfoItem(title: '等级', content: 'A级隐患'),
            _buildHazardInfoItem(title: '类型', content: '消防栓表面裂纹'),
            _buildHazardInfoItem(title: '来源', content: '年久失修'),
            _buildHazardInfoItem(title: '整改类型', content: '限期整改'),
            _buildHazardInfoItem(title: '整改期限', content: '2019-09-06'),
            _buildHazardInfoItem(title: '整改人', content: '高大陆'),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '隐患附件 :',
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
