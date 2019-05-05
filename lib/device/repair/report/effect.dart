import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/filter/page.dart';

import 'action.dart';
import 'state.dart';

Effect<ReportState> buildEffect() {
  return combineEffects(<Object, Effect<ReportState>>{
    ReportAction.action: _onAction,
    ReportAction.depart: _onDepartSkipFilter,
    ReportAction.applicant: _onApplicantSkipFilter,
  });
}

void _onAction(Action action, Context<ReportState> ctx) {}

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
