import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/warning_model.dart';

Widget buildView(
    WarningModel state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
//      dispatch(RecordItemActionCreator.onAction());
    },
    child: Container(
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
              spreadRadius: -9.0)
        ],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        children: <Widget>[
          _buildItemHeader(title: '火灾报警控制器', result: '${state.level}'),
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
                    child: Column(
                  children: <Widget>[
                    _buildItem(title: '预警原因 :', result: '${state.reason}'),
                    _buildItem(title: '责任部门 :', result: '${state.depart}'),
                    _buildItem(title: '责任人 :', result: '${state.pic}'),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
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
            style: TextStyle(color: Colors.black45, fontSize: 14.0,fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}
