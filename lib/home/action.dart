import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/banner_model.dart';

//TODO replace with your own action
enum HomeAction { banner, action }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action initBannerData(List<BannerModel> list) {
    return Action(HomeAction.banner, payload: list);
  }
}
