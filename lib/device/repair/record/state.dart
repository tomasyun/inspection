import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record_model.dart';

class RecordState implements Cloneable<RecordState> {
  RepairRecordModel model = RepairRecordModel();

  @override
  RecordState clone() {
    return RecordState()..model = model;
  }
}

RecordState initState(Map<String, dynamic> args) {
  return RecordState();
}
