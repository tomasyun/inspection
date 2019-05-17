import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/filter_model.dart';
import 'package:inspection/widget/filter_flow_delegate.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(
    FilterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: _buildFilterTitle(flag: state.flag),
      leading: Container(),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: _buildFlow(state: state),
    ),
  );
}

Widget _buildFilterTitle({String flag, String content = ''}) {
  if (flag == 'level') {
    content = '隐患等级';
  } else if (flag == 'type') {
    content = '隐患类型';
  } else if (flag == 'depart') {
    content = '责任部门';
  } else if (flag == 'applicant') {
    content = '申请人';
  }
  return Text(
    content,
    style: TextStyle(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
  );
}

Widget _buildFlowItem({FilterState state, Map<String, String> map}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(state.context).pop(map);
    },
    child: Container(
      height: 40.0,
      padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            map['name'],
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

List<Widget> _buildFlowData({FilterState state, List<Data> list}) {
  return list.map((item) {
    return _buildFlowItem(
        state: state, map: {'name': item.name, 'id': item.id.toString()});
  }).toList();
}

Widget _buildFlow({FilterState state}) {
  if (state.flag == 'level') {
    return Flow(
      delegate: FilterFlowDelegate(EdgeInsets.all(5.0)),
      children: _buildFlowData(
          state: state,
          list: state.filterModel != null &&
                  state.filterModel.data != null &&
                  state.filterModel.data.isNotEmpty
              ? state.filterModel.data
              : []),
    );
  } else if (state.flag == 'type') {
    return Flow(
      delegate: FilterFlowDelegate(EdgeInsets.all(5.0)),
      children: _buildFlowData(
          state: state,
          list: state.filterModel != null &&
                  state.filterModel.data != null &&
                  state.filterModel.data.isNotEmpty
              ? state.filterModel.data
              : []),
    );
  } else if (state.flag == 'depart') {
    return Flow(
      delegate: FilterFlowDelegate(EdgeInsets.all(5.0)),
//      children: _buildFlowData(state: state, list: state.departs),
    );
  } else if (state.flag == 'applicant') {
    return Flow(
      delegate: FilterFlowDelegate(EdgeInsets.all(5.0)),
//      children: _buildFlowData(state: state, list: state.applicants),
    );
  } else {
    return stateView.blackPage();
  }
}
