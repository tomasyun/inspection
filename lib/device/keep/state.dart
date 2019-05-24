import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record_model.dart';

class KeepState implements Cloneable<KeepState> {
  KeepRecordModel model = KeepRecordModel();
  String equipmentId;
  @override
  KeepState clone() {
    return KeepState()
      ..model = model
      ..equipmentId = equipmentId;
  }
}

KeepState initState(Map<String, dynamic> args) {
  KeepState state = KeepState();
  state.equipmentId = args['equipmentId'];
  return state;
}
