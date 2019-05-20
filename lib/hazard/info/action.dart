import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_info_model.dart';

//TODO replace with your own action
enum HazardInfoAction {
  action,
  skipRectifyCostApply,
  skipRectifyReport,
  skipRectifyInfo,
  skipRecheckReport,
  skipHazardAllInfo,
  info,
}

class HazardInfoActionCreator {
  static Action onAction() {
    return Action(HazardInfoAction.action);
  }

  static Action onGetHazardInfoAction(HazardInfoModel model) {
    return Action(HazardInfoAction.info, payload: model);
  }

  static Action onSkipRectifyInfo() {
    return Action(HazardInfoAction.skipRectifyInfo);
  }

  static Action onSkipRectifyReport() {
    return Action(HazardInfoAction.skipRectifyReport);
  }

  static Action onSkipRectifyCostApply() {
    return Action(HazardInfoAction.skipRectifyCostApply);
  }

  static Action onSkipRecheckReport() {
    return Action(HazardInfoAction.skipRecheckReport);
  }

  static Action onSkipHazardAllInfo() {
    return Action(HazardInfoAction.skipHazardAllInfo);
  }
}
