import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/banner_model.dart';

//TODO replace with your own action
enum HomeAction { banner, action, scan, hazardReport, breakdownReport }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action initBannerData(List<BannerModel> list) {
    return Action(HomeAction.banner, payload: list);
  }

  static Action onScanQRCode() {
    return Action(HomeAction.scan);
  }

  static Action onHazardReport() {
    return Action(HomeAction.hazardReport);
  }

  static Action onBreakDownReport() {
    return Action(HomeAction.breakdownReport);
  }
}
