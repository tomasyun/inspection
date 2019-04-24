import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RectifyReportAction { action }

class RectifyReportActionCreator {
  static Action onAction() {
    return const Action(RectifyReportAction.action);
  }
}
