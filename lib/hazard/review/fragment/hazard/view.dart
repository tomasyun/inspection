import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';

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
                '描述 :',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                child: state.model != null &&
                        state.model.data != null &&
                        state.model.data.dangerRemark != null
                    ? Text(
                        state.model.data.dangerRemark,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black45,
                        ),
                      )
                    : Text('')),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.equipmentName != null
                ? _buildHazardInfoItem(
                    title: '设备名称', content: state.model.data.equipmentName)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.equipmentCode != null
                ? _buildHazardInfoItem(
                    title: '设备编号', content: state.model.data.equipmentCode)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.dangerLevel != null
                ? _buildHazardInfoItem(
                    title: '隐患等级', content: state.model.data.dangerLevel)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.dangerType != null
                ? _buildHazardInfoItem(
                    title: '隐患类型', content: state.model.data.dangerType)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.repairPerson != null
                ? _buildHazardInfoItem(
                    title: '整改人', content: state.model.data.repairPerson)
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
                    state.model.data.reviewPerson != null
                ? _buildHazardInfoItem(
                    title: '复查人', content: state.model.data.reviewPerson)
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
                    state.model.data.liablePerson != null
                ? _buildHazardInfoItem(
                    title: '责任人', content: state.model.data.liablePerson)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.liableOrganization != null
                ? _buildHazardInfoItem(
                    title: '责任部门', content: state.model.data.liableOrganization)
                : Container(
                    height: 0.0,
                  ),
            state.model != null &&
                    state.model.data != null &&
                    state.model.data.createDate != null
                ? _buildHazardInfoItem(
                    title: '上报时间', content: state.model.data.createDate)
                : Container(
                    height: 0.0,
                  ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '隐患附件 :',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
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
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(fontSize: 14.0, color: Colors.black45),
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

Widget _buildGridView(HazardInfoFragState state) {
  List<Widget> list = [];

  if (state.model == null ||
      state.model.data == null ||
      state.model.data.attachments == null ||
      state.model.data.attachments.isEmpty) {
    list = [
      _buildSpaceAttachment(),
      _buildSpaceAttachment(),
      _buildSpaceAttachment(),
      _buildSpaceAttachment()
    ];
  } else {
    for (int i = 0; i < state.model.data.attachments.length; i++) {
      list.add(_buildAttachment(state.model.data.attachments[i].fileUrl));
    }
  }
  return GridView.count(
    crossAxisCount: 3,
    children: list,
    crossAxisSpacing: 5.0,
    physics: NeverScrollableScrollPhysics(),
  );
}
