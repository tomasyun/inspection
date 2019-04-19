import 'package:fish_redux/fish_redux.dart';

class RepairState implements Cloneable<RepairState> {
  @override
  RepairState clone() {
    return RepairState();
  }
}

RepairState initState(Map<String, dynamic> args) {
  return RepairState();
}
