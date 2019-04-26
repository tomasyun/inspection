import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

//TODO replace with your own action
enum HazardAction { init, action }

class HazardActionCreator {
  static Action onAction() {
    return const Action(HazardAction.action);
  }

  static Action onInitHazardListData(List<HazardModel> list) {
    return Action(HazardAction.init, payload: list);
  }
}
