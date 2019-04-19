import 'package:fish_redux/fish_redux.dart';

class FunctionState implements Cloneable<FunctionState> {
  @override
  FunctionState clone() {
    return FunctionState();
  }
}

FunctionState initState(Map<String, dynamic> args) {
  return FunctionState();
}
