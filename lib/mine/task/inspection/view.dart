import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/inspect_content_model.dart';
import 'package:inspection/mine/task/inspection/action.dart';
import 'package:inspection/widget/state_view.dart' as stateView;
import 'package:inspection/widget/switch_button.dart';

import 'state.dart';

Widget buildView(
  InspectionTaskState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '检查内容',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: _buildInspectionTaskBody(dispatch, state),
  );
}

Widget _buildInspectionTaskBody(
  Dispatch dispatch,
  InspectionTaskState state,
) {
  if (state.model == null ||
      state.model.data == null ||
      state.model.data.isEmpty) {
    return Container(
      child: stateView.blackPage(),
    );
  } else {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    state.map['deviceName'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
          ),
          Container(
            child: Column(
              children: _buildAllTaskList(dispatch, state.model.data),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(top: 50.0),
            child: _buildRaisedButton(dispatch: dispatch),
          )
        ],
      )),
    );
  }
}

List<Widget> _buildAllTaskList(
  Dispatch dispatch,
  List<Data> data,
) {
  if (data.isNotEmpty) {
    return data.map((item) {
      return _buildInspectionTaskItem(dispatch, item);
    }).toList();
  } else {
    return <Widget>[];
  }
}

Widget _buildInspectionTaskItem(
  Dispatch dispatch,
  Data data,
) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    margin: EdgeInsets.only(top: 1),
    color: Colors.white,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Container(
          child: Text(
            data.targetName,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        )),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: SwitchButton(
            isOpen: data.isOpen,
            size: Size(60.0, 30.0),
            callback: () {
              data.isOpen = !data.isOpen;
              dispatch(InspectionTaskActionCreator.onShowBottomSheet());
            },
          ),
        )
      ],
    ),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 15.0),
    child: RaisedButton(
        onPressed: () {
          dispatch(InspectionTaskActionCreator.onSubmit());
        },
        child: Text(
          '保存',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        color: Colors.blue,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
  );
}
