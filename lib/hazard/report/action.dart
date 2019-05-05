import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardReportAction { action, level, type, levelRst, typeRst }

class HazardReportActionCreator {
  static Action onAction() {
    return const Action(HazardReportAction.action);
  }

  static Action onLevelSkipFilter() {
    return Action(HazardReportAction.level);
  }

  static Action onTypeSkipFilter() {
    return Action(HazardReportAction.type);
  }

  static Action onGetLevelRst(String level) {
    return Action(HazardReportAction.levelRst, payload: level);
  }

  static Action onGetTypeRst(String level) {
    return Action(HazardReportAction.typeRst, payload: level);
  }
}
