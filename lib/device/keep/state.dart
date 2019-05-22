import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record_model.dart';

class KeepState implements Cloneable<KeepState> {
  KeepRecordModel model = KeepRecordModel();

  @override
  KeepState clone() {
    return KeepState()..model = model;
  }
}

KeepState initState(Map<String, dynamic> args) {
  return KeepState();
}
