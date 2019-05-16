import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/filter/page.dart';
import 'package:inspection/global/app_common.dart';

import 'action.dart';
import 'state.dart';

Effect<ReportState> buildEffect() {
  return combineEffects(<Object, Effect<ReportState>>{
    ReportAction.action: _onAction,
    ReportAction.depart: _onDepartSkipFilter,
    ReportAction.applicant: _onApplicantSkipFilter,
    ReportAction.report: _onReport,
    ReportAction.goBack: _onGoBack,
  });
}

void _onAction(Action action, Context<ReportState> ctx) {}

Future<bool> _onGoBack(Action action, Context<ReportState> ctx) {
  return Future<bool>.value(true);
}

void _onReport(Action action, Context<ReportState> ctx) {
//  AppCommons.showToast('暂未实现');
  if (ctx.state.deviceNoController.text.isEmpty) {
    AppCommons.showToast('设备编号不能为空');
  } else if (ctx.state.departRst == '选择责任部门') {
    AppCommons.showToast('请选择责任部门');
  } else if (ctx.state.applicantRst == '申请人') {
    AppCommons.showToast('请选择申请人');
  } else if (ctx.state.descController.text.isEmpty) {
    AppCommons.showToast('请填写故障描述');
  } else {
    AppCommons.showToast('暂未实现');
  }
}

void _onDepartSkipFilter(Action action, Context<ReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = {'flag': 'depart'};
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(ReportActionCreator.onGetDepartRst(value));
    }
  });
}

void _onApplicantSkipFilter(Action action, Context<ReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = {'flag': 'applicant'};
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(ReportActionCreator.onGetApplicantRst(value));
    }
  });
}
