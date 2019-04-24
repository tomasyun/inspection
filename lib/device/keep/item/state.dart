import 'package:fish_redux/fish_redux.dart';

class RecordItemState implements Cloneable<RecordItemState> {
  @override
  RecordItemState clone() {
    return RecordItemState();
  }
}

RecordItemState initState(Map<String, dynamic> args) {
  return RecordItemState();
}
