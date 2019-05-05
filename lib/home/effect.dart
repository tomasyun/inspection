import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/repair/report/page.dart';
import 'package:inspection/entity/banner_model.dart';
import 'package:inspection/hazard/report/page.dart';
import 'package:inspection/mine/task/inspection/page.dart';
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
    HomeAction.notice: _onSkipNoticePage
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _onSkipNoticePage(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return NoticePage().buildPage(null);
  }));
}

//void _onScanQRCode(Action action, Context<HomeState> ctx) async {
//  try {
//    String qrResult = await BarcodeScanner.scan();
//  } on PlatformException catch (ex) {
//    if (ex.code == BarcodeScanner.CameraAccessDenied) {
//     ("The permission was denied.");
//    } else {
//     ("unknown error ocurred $ex");
//    }
//  } on FormatException {
//    ("Scan canceled, try again !");
//  } catch (e) {
//   ("Unknown error $e");
//  }
//}

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
  List<BannerModel> list = [
    BannerModel(
        link:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814594647287.jpg',
        desc: '治愈系小可爱和你说晚安'),
    BannerModel(
        link:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814175817985.jpg',
        desc: '福豹”：跟我一起嗨'),
    BannerModel(
        link:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814245872100.jpg',
        desc: '冷静冷静，这也太有爱了吧'),
  ];
  ctx.dispatch(HomeActionCreator.initBannerData(list));
}
