import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardReportAction { action }

class HazardReportActionCreator {
  static Action onAction() {
    return const Action(HazardReportAction.action);
  }
}
