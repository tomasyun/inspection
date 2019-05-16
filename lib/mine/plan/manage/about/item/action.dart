import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlanAboutItemAction { action, scanQRCode }

class PlanAboutItemActionCreator {
  static Action onAction() {
    return const Action(PlanAboutItemAction.action);
  }

  static Action onScanQRCode() {
    return Action(PlanAboutItemAction.scanQRCode);
  }
}
