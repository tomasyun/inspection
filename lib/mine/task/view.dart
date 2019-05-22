import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/task_model.dart';
import 'package:inspection/hazard/info/page.dart';
import 'package:inspection/mine/task/action.dart';

import 'state.dart';

Widget buildView(TaskState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '代办任务',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Column(
          children: state.model != null && state.model.data != null
              ? _buildToDoWidgets(
                  state: state, model: state.model, dispatch: dispatch)
              : [],
        ),
      ),
    ),
  );
}

List<Widget> _buildToDoWidgets(
    {TaskState state, TaskModel model, Dispatch dispatch}) {
  List<Widget> list = [];
  if (model.data.rectify != null && model.data.rectify.isNotEmpty) {
    model.data.rectify.map((item) {
      list.add(_rectify(state, item));
    }).toList();
  }

  if (model.data.review != null && model.data.review.isNotEmpty) {
    model.data.review.map((item) {
      list.add(_recheck(state, item));
    }).toList();
  }

  if (model.data.inspect != null && model.data.inspect.isNotEmpty) {
    model.data.inspect.map((item) {
      list.add(_inspect(item, dispatch));
    }).toList();
  }
  return list;
}

Widget _recheck(TaskState state, Review review) {
  Map<String, dynamic> map = Map();
  map['id'] = review.dangerId;
  if (review.todoType == '0') {
    map['state'] = '待审批';
  } else if (review.todoType == '1') {
    map['state'] = '待整改';
  } else if (review.todoType == '2') {
    map['state'] = '待复查';
  }
  return Container(
    margin: EdgeInsets.all(15.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey[800],
            blurRadius: 10.0,
            offset: Offset(0.0, 2.0),
            spreadRadius: -7.0)
      ],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          _buildItemHeader(
              title: '${review.equipmentName}', result: '${map['state']}'),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            color: Colors.black12,
            height: 0.5,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Column(
                      children: <Widget>[
                        _buildItem(
                            title: '位置', result: '${review.dangerAddress}'),
                        _buildItem(
                            title: '隐患描述', result: '${review.dangerRemark}'),
                        _buildItem(
                            title: '隐患类型', result: '${review.dangerType}'),
                        _buildItem(
                            title: '编号', result: '${review.equipmentCode}'),
                      ],
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          '${review.dangerLevel}',
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 45.0),
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            Navigator.of(state.context)
                                .push(MaterialPageRoute(builder: (content) {
                              return HazardInfoPage().buildPage(map);
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text(
                            '${map['state']}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                        ),
                      ),
                    ],
                  ),
                  flex: 2,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _rectify(TaskState state, Rectify rectify) {
  Map<String, dynamic> map = Map();
  map['id'] = rectify.dangerId;
  if (rectify.todoType == '0') {
    map['state'] = '待审批';
  } else if (rectify.todoType == '1') {
    map['state'] = '待整改';
  } else if (rectify.todoType == '2') {
    map['state'] = '待复查';
  }
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.all(15.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey[800],
            blurRadius: 10.0,
            offset: Offset(0.0, 2.0),
            spreadRadius: -7.0)
      ],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Column(
      children: <Widget>[
        _buildItemHeader(
            title: rectify.equipmentName, result: '${map['state']}'),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          color: Colors.black12,
          height: 0.5,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      _buildItem(
                          title: '位置', result: '${rectify.dangerAddress}'),
                      _buildItem(
                          title: '隐患描述', result: '${rectify.dangerRemark}'),
                      _buildItem(
                          title: '隐患类型', result: '${rectify.dangerType}'),
                      _buildItem(
                          title: '编号', result: '${rectify.equipmentCode}'),
                    ],
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '${rectify.dangerLevel}',
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 45.0),
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          Navigator.of(state.context)
                              .push(MaterialPageRoute(builder: (content) {
                            return HazardInfoPage().buildPage(map);
                          }));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Text(
                          '${map['state']}',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                      ),
                    ),
                  ],
                ),
                flex: 2,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _inspect(Inspect inspect, Dispatch dispatch) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(15.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  blurRadius: 10.0,
                  offset: Offset(0.0, 2.0),
                  spreadRadius: -7.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            children: <Widget>[
              _buildItemHeader(
                  title: '${inspect.equipmentName}', result: '待检查'),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                color: Colors.black12,
                height: 0.5,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: Column(
                          children: <Widget>[
                            _buildItem(
                                title: '位置:', result: '${inspect.installArea}'),
                            _buildItem(
                                title: '编号',
                                result: '${inspect.equipmentCode}'),
                            _buildItem(
                                title: '设备类型',
                                result: '${inspect.equipmentType}'),
                          ],
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          color: Colors.green,
                          onPressed: () {
                            dispatch(TaskActionCreator.onScanQRCode());
                          },
                          child: Text(
                            '扫一扫',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                        ),
                      ),
                      flex: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildItem({String title, String result}) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            child: Text(
              result,
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 7,
        ),
      ],
    ),
  );
}

Widget _buildItemHeader({String title, String result}) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            result,
            style: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        )
      ],
    ),
  );
}
