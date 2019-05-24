import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/warning_model.dart';

Widget buildView(Data state, Dispatch dispatch, ViewService viewService) {
  Map<String, String> map = Map();
  if (state.warningLevel == '0') {
    map['level'] = '一般';
  } else if (state.warningLevel == '1') {
    map['level'] = '紧急';
  } else if (state.warningLevel == '2') {
    map['level'] = '已过期';
  }
  return GestureDetector(
    onTap: () {
//      dispatch(RecordItemActionCreator.onAction());
    },
    child: Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.0),
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
          _buildItemHeader(
              title: '${state.equipmentName}', result: '${map['level']}'),
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
                    _buildItem(
                        title: '预警原因 :',
                        result: state.warningLevel == '2'
                            ? '设备已过期'
                            : '设备${state.days}天后过期'),
                    _buildItem(title: '责任人 :', result: '${state.person}'),
                    _buildItem(
                        title: '责任部门 :', result: '${state.organization}'),
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
    margin: EdgeInsets.only(top: 5.0),
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
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 4,
        ),
        Expanded(
          child: Container(
            child: Text(
              result,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
          ),
          flex: 6,
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
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            result,
            style: TextStyle(
                color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}
