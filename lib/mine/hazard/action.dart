import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

//TODO replace with your own action
enum HazardHistoryAction { action, init }

class HazardHistoryActionCreator {
  static Action onAction() {
    return const Action(HazardHistoryAction.action);
  }

  static Action onInitHazardListData(List<HazardModel> list) {
    return Action(HazardHistoryAction.init, payload: list);
  }
}
