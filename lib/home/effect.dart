import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/repair/report/page.dart';
import 'package:inspection/entity/banner_model.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:inspection/hazard/report/page.dart';
import 'package:inspection/mine/task/inspection/page.dart';
import 'package:inspection/mine/task/page.dart';
import 'package:inspection/notice/page.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init,
    HomeAction.scan: _onScanQRCode,
    HomeAction.hazardReport: _onHazardReport,
    HomeAction.breakdownReport: _onBreakDownReport,
    HomeAction.notice: _onSkipNoticePage,
    HomeAction.moreTask: _onSkipMoreTask,
    HomeAction.moreNotice: _onSkipMoreNotice,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _onSkipMoreNotice(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return NoticePage().buildPage(null);
  }));
}

void _onSkipMoreTask(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TaskPage().buildPage(null);
  }));
}

void _onSkipNoticePage(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return NoticePage().buildPage(null);
  }));
}

void _onScanQRCode(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return InspectionTaskPage().buildPage(null);
  }));
}

void _onHazardReport(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return HazardReportPage().buildPage(null);
  }));
}

void _onBreakDownReport(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return ReportPage().buildPage(null);
  }));
}

void _init(Action action, Context<HomeState> ctx) {
  ctx.state.context = ctx.context;
  List<BannerModel> list = [];
  ctx.dispatch(HomeActionCreator.initBannerData(list));
  DicoHttpRepository.homeRequest().then((model) {
    if(model.code==0){
      ctx.dispatch(HomeActionCreator.onGetHomeModels(model));
    }else{
      AppCommons.showToast(model.msg);
    }
  });
}
