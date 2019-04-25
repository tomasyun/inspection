import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/banner_model.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

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
