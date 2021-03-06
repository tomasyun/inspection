import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/hazard/info/action.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(
  HazardInfoState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '隐患信息',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        state.model != null && state.model.data != null
            ? Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0, bottom: 100.0),
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[800],
                                blurRadius: 10.0,
                                offset: Offset(0.0, 3.0),
                                spreadRadius: -7.0)
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '隐患描述 :',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              child: state.model.data.dangerRemark != null
                                  ? Text(
                                      state.model.data.dangerRemark,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text('')),
                          state.model.data.equipmentName != null
                              ? _buildHazardInfoItem(
                                  title: '设备名称',
                                  content: state.model.data.equipmentName)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentCode != null
                              ? _buildHazardInfoItem(
                                  title: '设备编号',
                                  content: state.model.data.equipmentCode)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.dangerLevel != null
                              ? _buildHazardInfoItem(
                                  title: '隐患等级',
                                  content: state.model.data.dangerLevel)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.dangerType != null
                              ? _buildHazardInfoItem(
                                  title: '隐患类型',
                                  content: state.model.data.dangerType)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.repairPerson != null
                              ? _buildHazardInfoItem(
                                  title: '整改人',
                                  content: state.model.data.repairPerson)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.repairOrganization != null
                              ? _buildHazardInfoItem(
                                  title: '整改部门',
                                  content: state.model.data.repairOrganization)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.reviewPerson != null
                              ? _buildHazardInfoItem(
                                  title: '复查人',
                                  content: state.model.data.reviewPerson)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.reviewOrganization != null
                              ? _buildHazardInfoItem(
                                  title: '复查部门',
                                  content: state.model.data.reviewOrganization)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.liablePerson != null
                              ? _buildHazardInfoItem(
                                  title: '责任人',
                                  content: state.model.data.liablePerson)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.liableOrganization != null
                              ? _buildHazardInfoItem(
                                  title: '责任部门',
                                  content: state.model.data.liableOrganization)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.createDate != null
                              ? _buildHazardInfoItem(
                                  title: '上报时间',
                                  content: state.model.data.createDate)
                              : Container(
                                  height: 0.0,
                                ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Text(
                              '附件 :',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: _buildGridView(state),
                            constraints: BoxConstraints.tightFor(
                                width: double.infinity, height: 90.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                child: stateView.blackPage(),
              ),
        buildBottomNavigatorJudge(dispatch: dispatch, state: state.state),
      ],
    ),
  );
}

Widget _buildHazardInfoItem({String title, String content}) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
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
            textAlign: TextAlign.left,
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
            textAlign: TextAlign.right,
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

Widget _buildGridView(HazardInfoState state) {
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

Widget buildBottomNavigatorJudge(
    {Dispatch dispatch,
    String state,
    String leftLabel = '',
    String rightLabel = '',
    VoidCallback leftChecked,
    VoidCallback rightChecked}) {
  if (state == '待整改') {
    leftLabel = '整改费用申请';
    rightLabel = '整改上报';
    leftChecked = () {
      dispatch(HazardInfoActionCreator.onSkipRectifyCostApply());
    };
    rightChecked = () {
      dispatch(HazardInfoActionCreator.onSkipRectifyReport());
    };
    return buildBottomNavigatorDouble(
        dispatch: dispatch,
        leftLabel: leftLabel,
        rightLabel: rightLabel,
        leftChecked: leftChecked,
        rightChecked: rightChecked);
  } else if (state == '待复查') {
    leftLabel = '查看整改信息';
    rightLabel = '复查上报';
    leftChecked = () {
      dispatch(HazardInfoActionCreator.onSkipRectifyInfo());
    };
    rightChecked = () {
      dispatch(HazardInfoActionCreator.onSkipRecheckReport());
    };
    return buildBottomNavigatorDouble(
        dispatch: dispatch,
        leftLabel: leftLabel,
        rightLabel: rightLabel,
        leftChecked: leftChecked,
        rightChecked: rightChecked);
  } else if (state == '待审批') {
    leftLabel = '整改费用正在审批中';
    leftChecked = () {};
    return buildBottomNavigatorSingle(title: leftLabel, callback: leftChecked);
  } else if (state == '已完成') {
    leftLabel = '查看所有隐患信息';
    leftChecked = () {
      dispatch(HazardInfoActionCreator.onSkipHazardAllInfo());
    };
    return buildBottomNavigatorSingle(title: leftLabel, callback: leftChecked);
  } else {
    return Container(
      height: 0.0,
    );
  }
}

Widget buildBottomNavigatorDouble(
    {Dispatch dispatch,
    String leftLabel = '',
    String rightLabel = '',
    VoidCallback leftChecked,
    VoidCallback rightChecked}) {
  return Container(
    height: 60.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.center,
            color: Colors.grey[100],
            height: double.infinity,
            child: RaisedButton(
              color: Colors.orange,
              onPressed: leftChecked,
              child: Text(
                leftLabel,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              padding: EdgeInsets.only(
                  left: 35.0, right: 35.0, top: 15.0, bottom: 15.0),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.center,
            color: Colors.grey[100],
            height: double.infinity,
            child: RaisedButton(
              color: Colors.green,
              onPressed: rightChecked,
              child: Text(
                rightLabel,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              padding: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildBottomNavigatorSingle({
  Dispatch dispatch,
  String title = '',
  GestureTapCallback callback,
}) {
  return Container(
    height: 60.0,
    width: double.infinity,
    alignment: AlignmentDirectional.center,
    color: Colors.grey[100],
    child: RaisedButton(
      color: Colors.orange,
      onPressed: callback,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding:
          EdgeInsets.only(left: 100.0, right: 100.0, top: 15.0, bottom: 15.0),
    ),
  );
}
