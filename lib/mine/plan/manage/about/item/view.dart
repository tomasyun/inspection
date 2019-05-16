import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/plan_about_model.dart';
import 'package:inspection/mine/plan/manage/about/item/action.dart';

Widget buildView(
    PlanAboutModel state, Dispatch dispatch, ViewService viewService) {
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
              commonHeader(
                  title: '${state.deviceName}', result: state.taskState),
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
                            commonRow(title: '位置', result: '${state.location}'),
                            commonRow(title: '编号', result: '${state.deviceNo}'),
                            commonRow(
                                title: '设备类型', result: '${state.deviceType}'),
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
                            dispatch(PlanAboutItemActionCreator.onScanQRCode());
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

Widget commonRow({String title, String result}) {
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

Widget commonHeader({String title, String result}) {
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
