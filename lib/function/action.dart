import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FunctionAction {
  action,
  scanQRCode,
  warning,
  hazardReview,
  inspectionPlan,
  minePlan,
  analyse,
}

class FunctionActionCreator {
  static Action onAction() {
    return const Action(FunctionAction.action);
  }

  static Action onDeviceScanQRCode() {
    return Action(FunctionAction.scanQRCode);
  }

  static Action onDeviceWarning() {
    return Action(FunctionAction.warning);
  }

  static Action onHazardReview() {
    return Action(FunctionAction.hazardReview);
  }

  static Action onInspectionPlan() {
    return Action(FunctionAction.inspectionPlan);
  }

  static Action onSkipMinePlan() {
    return Action(FunctionAction.minePlan);
  }

  static Action onSkipSaveAnalyse() {
    return Action(FunctionAction.analyse);
  }
}
