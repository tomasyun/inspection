import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardInfoAction {
  action,
  skipRectifyCostApply,
  skipRectifyReport,
  skipRectifyInfo,
  skipRecheckReport,
  skipHazardAllInfo
}

class HazardInfoActionCreator {
  static Action onAction() {
    return const Action(HazardInfoAction.action);
  }

  static Action onSkipRectifyInfo() {
    return const Action(HazardInfoAction.skipRectifyInfo);
  }

  static Action onSkipRectifyReport() {
    return const Action(HazardInfoAction.skipRectifyReport);
  }

  static Action onSkipRectifyCostApply() {
    return const Action(HazardInfoAction.skipRectifyCostApply);
  }

  static Action onSkipRecheckReport() {
    return const Action(HazardInfoAction.skipRecheckReport);
  }

  static Action onSkipHazardAllInfo() {
    return const Action(HazardInfoAction.skipHazardAllInfo);
  }
}
