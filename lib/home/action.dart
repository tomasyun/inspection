import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/banner_model.dart';
import 'package:inspection/entity/home_model.dart';

//TODO replace with your own action
enum HomeAction {
  banner,
  action,
  hazardReport,
  breakdownReport,
  notice,
  moreTask,
  getModels,
  moreNotice
}

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action initBannerData(List<BannerModel> list) {
    return Action(HomeAction.banner, payload: list);
  }

  static Action onGetHomeModels(HomeModel model) {
    return Action(HomeAction.getModels, payload: model);
  }

  static Action onHazardReport() {
    return Action(HomeAction.hazardReport);
  }

  static Action onBreakDownReport() {
    return Action(HomeAction.breakdownReport);
  }

  static Action onSkipNoticePage() {
    return Action(HomeAction.notice);
  }

  static Action onSkipMoreTask() {
    return Action(HomeAction.moreTask);
  }

  static Action onSkipMoreNotice() {
    return Action(HomeAction.moreNotice);
  }
}
