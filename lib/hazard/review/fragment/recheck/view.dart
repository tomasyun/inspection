import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';

import 'state.dart';

Widget buildView(
    RecheckInfoFragState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.grey[100],
    child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.0),
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
                '复查情况',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                state.model != null &&
                        state.model.data != null &&
                        state.model.data.reviewResult != null
                    ? state.model.data.reviewResult
                    : '',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.w600),
              ),
            ),
            _buildHazardInfoItem(
                title: '复查人',
                content: state.model != null &&
                        state.model.data != null &&
                        state.model.data.reviewUser != null
                    ? state.model.data.reviewUser
                    : ''),
            _buildHazardInfoItem(
                title: '复查部门',
                content: state.model != null &&
                        state.model.data != null &&
                        state.model.data.reviewOrganization != null
                    ? state.model.data.reviewOrganization
                    : ''),
            _buildHazardInfoItem(
                title: '复查时间',
                content: state.model != null &&
                        state.model.data != null &&
                        state.model.data.reviewDate != null
                    ? state.model.data.reviewDate
                    : ''),
            _buildHazardInfoItem(
                title: '整改人',
                content: state.model != null &&
                        state.model.data != null &&
                        state.model.data.repairUser != null
                    ? state.model.data.repairUser
                    : ''),
            _buildHazardInfoItem(
                title: '整改部门',
                content: state.model != null &&
                        state.model.data != null &&
                        state.model.data.repairOrganization != null
                    ? state.model.data.repairOrganization
                    : ''),
            _buildHazardInfoItem(
                title: '整改时间',
                content: state.model != null &&
                        state.model.data != null &&
                        state.model.data.repairDate != null
                    ? state.model.data.repairDate
                    : ''),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '复查附件',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: _buildGridView(state),
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black45,
                fontWeight: FontWeight.w600),
          ),
          flex: 7,
        )
      ],
    ),
  );
}

Widget _buildSpaceAttachment() {
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

Widget _buildAttachment(String url) {
  return Container(
    child: FadeInImage.assetNetwork(
        image: AppCommons.attachmentBaseUrl + url, fit: BoxFit.fill),
    height: 100.0,
  );
}

Widget _buildGridView(RecheckInfoFragState state) {
  List<Widget> list = [];

  if (state.model == null ||
      state.model.data == null ||
      state.model.data.reviewAttachments == null ||
      state.model.data.reviewAttachments.isEmpty) {
    list = [
      _buildSpaceAttachment(),
      _buildSpaceAttachment(),
      _buildSpaceAttachment(),
      _buildSpaceAttachment()
    ];
  } else {
    for (int i = 0; i < state.model.data.reviewAttachments.length; i++) {
      list.add(_buildAttachment(state.model.data.reviewAttachments[i].fileUrl));
    }
  }
  return GridView.count(
    crossAxisCount: 3,
    children: list,
    crossAxisSpacing: 5.0,
    physics: NeverScrollableScrollPhysics(),
  );
}
