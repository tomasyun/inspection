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
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 100.0),
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
              width: double.infinity,
              child: Text(
                state.model != null &&
                        state.model.data != null &&
                        state.model.data.repairResult != null
                    ? state.model.data.repairResult
                    : '',
                style: TextStyle(
                    fontSize: 14.0, color: Colors.black, letterSpacing: 2),
              ),
            ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.repairOpinion != null
                ? _buildHazardInfoItem(
                    title: '整改意见', content: state.model.data.repairOpinion)
                : Container(
                    height: 0.0,
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
              constraints: BoxConstraints.tightFor(
                  width: double.infinity, height: 130.0),
            ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.repairUser != null
                ? _buildHazardInfoItem(
                    title: '整改人', content: state.model.data.repairUser)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.repairOrganization != null
                ? _buildHazardInfoItem(
                    title: '整改部门', content: state.model.data.repairOrganization)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.reviewUser != null
                ? _buildHazardInfoItem(
                    title: '复查人', content: state.model.data.reviewUser)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.reviewOrganization != null
                ? _buildHazardInfoItem(
                    title: '复查部门', content: state.model.data.reviewOrganization)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.reviewDate != null
                ? _buildHazardInfoItem(
                    title: '复查时间', content: state.model.data.reviewDate)
                : Container(
                    height: 0.0,
                  ),
          ],
        ),
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
