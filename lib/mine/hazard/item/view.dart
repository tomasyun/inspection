import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/mine/hazard/item/action.dart';

Widget buildView(
    HazardModel state, Dispatch dispatch, ViewService viewService) {
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
            spreadRadius: -9.0)
      ],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Column(
      children: <Widget>[
        _buildItemHeader(title: '火灾报警控制器', result: '${state.state}'),
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
                      _buildItem(title: '位置 :', result: '${state.state}'),
                      _buildItem(title: '隐患描述 :', result: '${state.desc}'),
                      _buildItem(title: '隐患类型 :', result: '${state.depart}'),
                      _buildItem(title: '编号 :', result: '${state.date}'),
                    ],
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '重大隐患',
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 45.0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          dispatch(HistoryItemActionCreator.onSkipInfo());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Text(
                          '${state.state}',
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
          flex: 4,
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              result,
              style: TextStyle(color: Colors.black45, fontSize: 14.0),
            ),
          ),
          flex: 6,
        )
      ],
    ),
  );
}
