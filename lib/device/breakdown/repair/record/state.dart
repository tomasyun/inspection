import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';

class RecordState implements Cloneable<RecordState> {
  List<RepairRecItem> datalist = List<RepairRecItem>();

  @override
  RecordState clone() {
    return RecordState()..datalist = datalist;
  }
}

RecordState initState(Map<String, dynamic> args) {
  return RecordState();
}
