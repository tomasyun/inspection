import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record_model.dart';

class RecordState implements Cloneable<RecordState> {
  RepairRecordModel model = RepairRecordModel();
  String equipmentId;

  @override
  RecordState clone() {
    return RecordState()
      ..model = model
      ..equipmentId = equipmentId;
  }
}

RecordState initState(Map<String, dynamic> args) {
  RecordState state = RecordState();
  state.equipmentId = args['equipmentId'];
  return state;
}
