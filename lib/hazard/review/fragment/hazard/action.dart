import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_info_model.dart';

//TODO replace with your own action
enum HazardInfoFragAction {
  action,
  model,
}

class HazardInfoFragActionCreator {
  static Action onAction() {
    return const Action(HazardInfoFragAction.action);
  }

  static Action onGetHazardModelAction(HazardInfoModel model) {
    return Action(HazardInfoFragAction.model, payload: model);
  }
}
