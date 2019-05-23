import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/hazard/info/page.dart';

Widget buildView(Data data, Dispatch dispatch, ViewService viewService) {
  Map<String, dynamic> map = Map();
  map['id'] = data.dangerId;
  if (data.todoType == '0') {
    map['state'] = '待审批';
  } else if (data.todoType == '1') {
    map['state'] = '待整改';
  } else if (data.todoType == '2') {
    map['state'] = '待审批';
  } else if (data.todoType == '3') {
    map['state'] = '已完成';
  }
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(bottom: 10.0),
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
                      _buildItem(title: '位置', result: '${data.dangerAddress}'),
                      _buildItem(title: '隐患描述', result: '${data.dangerRemark}'),
                      _buildItem(title: '隐患类型', result: '${data.dangerType}'),
                      _buildItem(title: '编号', result: '${data.equipmentCode}'),
                    ],
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '${data.dangerLevel}',
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 45.0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(viewService.context)
                              .push(MaterialPageRoute(builder: (content) {
                            return HazardInfoPage().buildPage(map);
                          }));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: _buildStateBtnText('${map['state']}'),
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

Widget _buildStateBtnText(String title) {
  if (title == '待整改') {
    return Text('去整改',
        style: TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600));
  } else if (title == '待复查') {
    return Text('去复查',
        style: TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600));
  } else if (title == '待审批') {
    return Text('查看',
        style: TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600));
  } else if (title == '已完成') {
    return Text('查看',
        style: TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600));
  } else {
    return Text(title,
        style: TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600));
  }
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
          flex: 3,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(
              result,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black45,
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
                  fontWeight: FontWeight.w600),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            result,
            style: TextStyle(
                color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
