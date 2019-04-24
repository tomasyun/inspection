import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecheckReportAction { action }

class RecheckReportActionCreator {
  static Action onAction() {
    return const Action(RecheckReportAction.action);
  }
}
