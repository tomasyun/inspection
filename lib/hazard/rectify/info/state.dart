import 'package:fish_redux/fish_redux.dart';

class RectifyInfoState implements Cloneable<RectifyInfoState> {
  @override
  RectifyInfoState clone() {
    return RectifyInfoState();
  }
}

RectifyInfoState initState(Map<String, dynamic> args) {
  return RectifyInfoState();
}
