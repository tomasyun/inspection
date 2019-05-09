import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/todos_model.dart';
import 'package:inspection/hazard/info/page.dart';

import 'state.dart';

Widget buildView(TaskState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '代办任务',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Column(
          children: _buildToDoWidgets(state, state.model),
        ),
      ),
    ),
  );
}

List<Widget> _buildToDoWidgets(TaskState state, ToDosModel model) {
  List<Widget> list = [];
  if (model.rectify != null) {
    model.rectify.map((rectify) {
      list.add(_rectify(state, rectify));
    }).toList();
  }

  if (model.recheck != null) {
    model.recheck.map((recheck) {
      list.add(_recheck(state, recheck));
    }).toList();
  }

  if (model.keep != null) {
    model.keep.map((keep) {
      list.add(_keep(keep));
    }).toList();
  }

  if (model.inspect != null) {
    model.inspect.map((inspect) {
      list.add(_inspect(inspect));
    }).toList();
  }
  return list;
}

Widget _recheck(TaskState state, Recheck recheck) {
  return GestureDetector(
    onTap: () {
      Navigator.of(state.context).push(MaterialPageRoute(builder: (content) {
        Map<String, dynamic> map = {'state': recheck.state};
        return HazardInfoPage().buildPage(map);
      }));
    },
    child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[800],
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
                spreadRadius: -9.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildItem(title: '隐患描述 :', result: '${recheck.desc}'),
              _buildItem(title: '责任部门 :', result: '${recheck.depart}'),
              _buildItem(title: '复查时间 :', result: '${recheck.date}'),
              _buildItem(title: '复查人 :', result: '${recheck.rechecker}'),
              _buildItem(title: '隐患状态 :', result: '${recheck.state}'),
            ],
          ),
        )),
  );
}

Widget _rectify(TaskState state, Rectify rectify) {
  return GestureDetector(
    onTap: () {
      Navigator.of(state.context).push(MaterialPageRoute(builder: (content) {
        Map<String, dynamic> map = {'state': rectify.state};
        return HazardInfoPage().buildPage(map);
      }));
    },
    child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[800],
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
                spreadRadius: -9.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildItem(title: '隐患描述 :', result: '${rectify.desc}'),
              _buildItem(title: '责任部门 :', result: '${rectify.depart}'),
              _buildItem(title: '发现时间 :', result: '${rectify.date}'),
              _buildItem(title: '隐患状态 :', result: '${rectify.state}'),
              _buildItem(title: '整改人 :', result: '${rectify.rectifier}'),
            ],
          ),
        )),
  );
}

Widget _keep(Keep keep) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[800],
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
                spreadRadius: -9.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildItem(title: '保养时间 :', result: '${keep.date}'),
              _buildItem(title: '保养人 :', result: '${keep.keeper}'),
              _buildItem(title: '保养状态 :', result: '${keep.state}'),
              _buildItem(title: '备注 :', result: '${keep.remark}'),
            ],
          ),
        )),
  );
}

Widget _inspect(Inspect inspect) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  blurRadius: 10.0,
                  offset: Offset(0.0, 2.0),
                  spreadRadius: -9.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    _buildItem(title: '设备名称 :', result: '${inspect.name}'),
                    _buildItem(title: '责任人 :', result: '${inspect.pic}'),
                    _buildItem(title: '责任部门 :', result: '${inspect.depart}'),
                    _buildItem(title: '状态 :', result: '${inspect.state}'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: AlignmentDirectional.center,
                  color: Colors.blue,
                  width: double.infinity,
                  height: 50.0,
                  child: Text(
                    '去扫码',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildItem({String title, String result}) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Text(
              result,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 7,
        )
      ],
    ),
  );
}
