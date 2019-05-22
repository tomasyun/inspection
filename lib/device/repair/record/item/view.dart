import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/repair_record_model.dart';

Widget buildView(Data data, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
//      dispatch(RecordItemActionCreator.onAction());
    },
    child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.0),
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
          child: Column(
            children: <Widget>[
              _buildItemHeader(title: '${data.equipmentName}', result: '已维修'),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                color: Colors.black12,
                height: 0.5,
              ),
              _buildItem(title: '维修人', result: '${data.repairPersonName}'),
              _buildItem(title: '上报时间', result: '${data.repairDate}'),
              _buildItem(title: '责任人', result: '${data.personLiableName}'),
              _buildItem(title: '责任部门', result: '${data.organizationName}'),
            ],
          ),
        )),
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
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 4,
        ),
        Expanded(
          child: Container(
            child: Text(
              result,
              style: TextStyle(fontSize: 14.0, color: Colors.black45),
              textAlign: TextAlign.left,
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
              style: TextStyle(color: Colors.black, fontSize: 16.0),
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
