import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';

//TODO replace with your own action
enum RecordAction { action }

class RecordActionCreator {
  static Action initListData(List<RepairRecItem> list) {
    return Action(RecordAction.action, payload: list);
  }
}
