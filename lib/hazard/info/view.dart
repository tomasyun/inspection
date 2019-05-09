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
        buildBottomNavigatorJudge(dispatch: dispatch, state: state.state),
        Container(
          height: double.infinity,
          padding: EdgeInsets.only(bottom: 60),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '隐患描述 :',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    margin: EdgeInsets.only(top: 15.0),
                    child: Text(
                      '西安市高新区丈八一路汇鑫IBC B座1005,办公室墙面墙皮脱落',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Text(
                      '隐患附件 :',
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
                        width: double.infinity, height: 100.0),
                  ),
                  _buildHazardInfoItem(
                      title: '责任部门: ', content: '陕西缔科网络科技有限公司'),
                  _buildHazardInfoItem(title: '责任人: ', content: '贠拓'),
                  _buildHazardInfoItem(title: '隐患等级: ', content: 'A级隐患'),
                  _buildHazardInfoItem(title: '隐患类型: ', content: '消防栓表面裂纹'),
                  _buildHazardInfoItem(title: '隐患来源: ', content: '年久失修'),
                  _buildHazardInfoItem(title: '整改类型: ', content: '限期整改'),
                  _buildHazardInfoItem(title: '整改期限: ', content: '2019-09-06'),
                  _buildHazardInfoItem(title: '整改人: ', content: '高大陆'),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildHazardInfoItem({String title, String content}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0),
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

Widget buildBottomNavigatorJudge(
    {Dispatch dispatch,
    String state,
    String title1 = '',
    String title2 = '',
    GestureTapCallback callback1,
    GestureTapCallback callback2}) {
  if (state == '待整改') {
    title1 = '整改费用申请';
    title2 = '整改上报';
    callback1 = () {
      dispatch(HazardInfoActionCreator.onSkipRectifyCostApply());
    };
    callback2 = () {
      dispatch(HazardInfoActionCreator.onSkipRectifyReport());
    };
    return buildBottomNavigatorDouble(
        dispatch: dispatch,
        title1: title1,
        title2: title2,
        callback1: callback1,
        callback2: callback2);
  } else if (state == '待复查') {
    title1 = '查看整改信息';
    title2 = '复查上报';
    callback1 = () {
      dispatch(HazardInfoActionCreator.onSkipRectifyInfo());
    };
    callback2 = () {
      dispatch(HazardInfoActionCreator.onSkipRecheckReport());
    };
    return buildBottomNavigatorDouble(
        dispatch: dispatch,
        title1: title1,
        title2: title2,
        callback1: callback1,
        callback2: callback2);
  } else if (state == '待审批') {
    title1 = '整改费用正在审批中';
    callback1 = () {};
    return buildBottomNavigatorSingle(title: title1, callback: callback1);
  } else if (state == '已完成') {
    title1 = '查看所有隐患信息';
    callback1 = () {
      dispatch(HazardInfoActionCreator.onSkipHazardAllInfo());
    };
    return buildBottomNavigatorSingle(title: title1, callback: callback1);
  } else {
    return Container(
      height: 0.0,
    );
  }
}

Widget buildBottomNavigatorDouble(
    {Dispatch dispatch,
    String title1 = '',
    String title2 = '',
    GestureTapCallback callback1,
    GestureTapCallback callback2}) {
  return Container(
    height: 60.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: callback1,
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.red,
              height: double.infinity,
              child: Text(
                title1,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: callback2,
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.grey,
              height: double.infinity,
              child: Text(
                title2,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
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
  return GestureDetector(
    onTap: callback,
    child: Container(
      height: 60.0,
      width: double.infinity,
      alignment: AlignmentDirectional.center,
      color: Colors.red,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
