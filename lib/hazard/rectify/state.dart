import 'package:fish_redux/fish_redux.dart';

class RectifyState implements Cloneable<RectifyState> {
  @override
  RectifyState clone() {
    return RectifyState();
  }
}

RectifyState initState(Map<String, dynamic> args) {
  return RectifyState();
}
