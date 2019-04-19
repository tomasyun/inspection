import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum QRScanAction { action }

class QRScanActionCreator {
  static Action onAction(String result) {
    return Action(QRScanAction.action, payload: result);
  }
}
