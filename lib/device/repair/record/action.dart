import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record_model.dart';

//TODO replace with your own action
enum RecordAction { action }

class RecordActionCreator {
  static Action initListData(RepairRecordModel model) {
    return Action(RecordAction.action, payload: model);
  }
}
