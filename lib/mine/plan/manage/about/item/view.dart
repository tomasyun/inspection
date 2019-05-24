import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/plan_about_model.dart';
import 'package:inspection/mine/task/inspection/page.dart';

Widget buildView(Data data, Dispatch dispatch, ViewService viewService) {
  Map<String, String> map = Map();
  if (data.inspectionStatus == '0') {
    map['state'] = '待巡检';
  } else if (data.inspectionStatus == '1') {
    map['state'] = '已巡检';
  }
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
                  spreadRadius: -9.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            children: <Widget>[
              commonHeader(
                  title: '${data.equipmentName}', result: '${map['state']}'),
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
                            commonRow(
                                title: '位置',
                                result: '${data.equipmentAddress}'),
                            commonRow(
                                title: '编号', result: '${data.equipmentCode}'),
                            commonRow(
                                title: '设备类型',
                                result: '${data.equipmentClass}'),
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
                            Map<String, dynamic> map = Map();
                            map['equipmentId'] = data.equipmentId;
                            Navigator.of(viewService.context)
                                .push(MaterialPageRoute(builder: (content) {
                              return InspectionTaskPage().buildPage(map);
                            }));
                          },
                          child: data.inspectionStatus == '0'
                              ? Text(
                                  '扫一扫',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600),
                                )
                              : Container(
                                  height: 0.0,
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
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            child: Text(
              result,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
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
                  fontWeight: FontWeight.w700,
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
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          flex: 6,
        )
      ],
    ),
  );
}
