import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/hazard/item/action.dart';

Widget buildView(
    HazardModel state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(HazardItemActionCreator.onSkipInfo());
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
          _buildItem(title: '隐患描述 :', result: '${state.desc}'),
          _buildItem(title: '责任部门 :', result: '${state.depart}'),
          _buildItem(title: '发现时间 :', result: '${state.data}'),
          _buildItem(title: '隐患状态 :', result: '${state.state}'),
          _buildItem(title: '整改人 :', result: '${state.rectifier}'),
        ],
      )),
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
