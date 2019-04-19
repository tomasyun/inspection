import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReportAction { action }

class ReportActionCreator {
  static Action onAction() {
    return const Action(ReportAction.action);
  }
}
