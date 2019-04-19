import 'package:fish_redux/fish_redux.dart';

class WarningState implements Cloneable<WarningState> {
  @override
  WarningState clone() {
    return WarningState();
  }
}

WarningState initState(Map<String, dynamic> args) {
  return WarningState();
}
