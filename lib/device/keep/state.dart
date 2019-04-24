import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record.dart';

class KeepState implements Cloneable<KeepState> {
  List<KeepRecord> list = List<KeepRecord>();
  @override
  KeepState clone() {
    return KeepState()..list = list;
  }
}

KeepState initState(Map<String, dynamic> args) {
  return KeepState();
}
