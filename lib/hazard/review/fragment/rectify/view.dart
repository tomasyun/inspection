import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';

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
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                state.model != null &&
                        state.model.data != null &&
                        state.model.data.repairResult != null
                    ? '${state.model.data.repairResult}'
                    : '',
                style: TextStyle(fontSize: 14.0, color: Colors.black45),
              ),
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
                    state.model.data.repairDate != null
                ? _buildHazardInfoItem(
                    title: '整改时间', content: state.model.data.repairDate)
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
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '整改附件',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            content,
            textAlign: TextAlign.right,
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
    child: FadeInImage.assetNetwork(
        placeholder: 'images/ic_add_on.png', image: '', fit: BoxFit.fill),
    height: 100.0,
    color: Colors.grey,
  );
}

Widget _buildAttachment(String url) {
  return Container(
    child: FadeInImage.assetNetwork(
        placeholder: 'images/ic_add_on.png',
        image: AppCommons.attachmentBaseUrl + url,
        fit: BoxFit.fill),
    height: 100.0,
  );
}

Widget _buildGridView(RectifyInfoFragState state) {
  List<Widget> list = [];

  if (state.model == null ||
      state.model.data == null ||
      state.model.data.repairAttachments == null ||
      state.model.data.repairAttachments.isEmpty) {
    list = [
      _buildSpaceAttachment(),
      _buildSpaceAttachment(),
      _buildSpaceAttachment(),
      _buildSpaceAttachment()
    ];
  } else {
    for (int i = 0; i < state.model.data.repairAttachments.length; i++) {
      list.add(_buildAttachment(state.model.data.repairAttachments[i].fileUrl));
    }
  }
  return GridView.count(
    crossAxisCount: 3,
    children: list,
    crossAxisSpacing: 5.0,
    physics: NeverScrollableScrollPhysics(),
  );
}
