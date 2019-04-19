import 'package:fish_redux/fish_redux.dart';

class KeepState implements Cloneable<KeepState> {
  @override
  KeepState clone() {
    return KeepState();
  }
}

KeepState initState(Map<String, dynamic> args) {
  return KeepState();
}
