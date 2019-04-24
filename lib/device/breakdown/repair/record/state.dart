import 'package:fish_redux/fish_redux.dart';

class RecordState implements Cloneable<RecordState> {
  @override
  RecordState clone() {
    return RecordState();
  }
}

RecordState initState(Map<String, dynamic> args) {
  return RecordState();
}
