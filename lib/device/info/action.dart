import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/equipment_info_model.dart';

//TODO replace with your own action
enum InfoAction { action, repairRecord, keepRecord, model }

class InfoActionCreator {
  static Action onAction() {
    return const Action(InfoAction.action);
  }

  static Action onSkipRepairRecord() {
    return Action(InfoAction.repairRecord);
  }

  static Action onSkipKeepRecord() {
    return Action(InfoAction.keepRecord);
  }

  static Action onGetDeviceInfoModelAction(EquipmentInfoModel info) {
    return Action(InfoAction.model, payload: info);
  }
}
