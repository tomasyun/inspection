import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';

class RecordState implements Cloneable<RecordState> {
  List<RepairRecord> list = List<RepairRecord>();

  @override
  RecordState clone() {
    return RecordState()..list = list;
  }
}

RecordState initState(Map<String, dynamic> args) {
  return RecordState();
}
