import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/info/action.dart';

import 'state.dart';

Widget buildView(
    HazardInfoState state, Dispatch dispatch, ViewService viewService) {
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
        Container(
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
                          spreadRadius: -3.0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '描述 :',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      child: Text(
                        '西安市高新区丈八一路汇鑫IBC B座1005,办公室墙面墙皮脱落',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _buildHazardInfoItem(title: '设备名称', content: '火灾报警控制器'),
                    _buildHazardInfoItem(title: '设备编号', content: '001'),
                    _buildHazardInfoItem(title: '等级', content: 'A级隐患'),
                    _buildHazardInfoItem(title: '类型', content: '消防栓表面裂纹'),
                    _buildHazardInfoItem(title: '整改人', content: '高大陆'),
                    _buildHazardInfoItem(title: '整改类型', content: '限期整改'),
                    _buildHazardInfoItem(title: '责任人', content: '贠拓'),
                    _buildHazardInfoItem(
                        title: '责任部门', content: '陕西缔科网络科技有限公司'),
                    _buildHazardInfoItem(title: '上报时间', content: '2019-06-23'),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: Text(
                        '附件 :',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: _buildGridView(),
                      constraints: BoxConstraints.tightFor(
                          width: double.infinity, height: 90.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.left,
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            textAlign: TextAlign.right,
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

Widget buildBottomNavigatorJudge(
    {Dispatch dispatch,
    String state,
    String leftLabel = '',
    String rightLabel = '',
    GestureTapCallback leftChecked,
    GestureTapCallback rightChecked}) {
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
                style: TextStyle(fontSize: 14.0, color: Colors.white),
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
                style: TextStyle(fontSize: 14.0, color: Colors.white),
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
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding:
          EdgeInsets.only(left: 100.0, right: 100.0, top: 15.0, bottom: 15.0),
    ),
  );
}
