import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReportRecordAction { action }

class ReportRecordActionCreator {
  static Action onAction() {
    return const Action(ReportRecordAction.action);
  }
}
