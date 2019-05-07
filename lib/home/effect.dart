import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/repair/report/page.dart';
import 'package:inspection/entity/banner_model.dart';
import 'package:inspection/entity/home_model.dart';
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
    HomeAction.more: _onClickMoreBtn,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _onClickMoreBtn(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TaskPage().buildPage(null);
  }));
}

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
  ctx.state.context = ctx.context;
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

//  List<Rectify> rectify = [
//    Rectify(
//        desc: '车间地面留有设备机油',
//        depart: '缔科研发部',
//        date: '2019-08-08',
//        state: '待整改',
//        rectifier: '高大陆')
//  ];
  List<Recheck> recheck = [
    Recheck(
        desc: '办公室墙面掉皮',
        depart: '通昱消防',
        date: '2019-06-06',
        rechecker: '黄骁',
        state: '待复查')
  ];
//  List<Keep> keep = [
//    Keep(
//        state: '待保养',
//        remark: '新时代中国青年要勇于砥砺奋斗。奋斗是青春最亮丽的底色',
//        keeper: '王婷',
//        date: '2019-05-25')
//  ];

  List<Inspect> inspect = [
    Inspect(name: '日常检查', pic: '贠拓', depart: '陕西缔科网络科技有限公司', state: '待检查'),
  ];

//  Todos todo =
//      Todos(recheck: recheck, rectify: rectify, keep: keep, inspect: inspect);
  Todos todo = Todos(recheck: recheck, inspect: inspect);

  HomeModel model = HomeModel(banner: [], todos: todo, notice: '');
  ctx.dispatch(HomeActionCreator.onGetHomeModels(model));
}
