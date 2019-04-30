import 'package:fish_redux/fish_redux.dart';

class RectifyInfoFragState implements Cloneable<RectifyInfoFragState> {
  @override
  RectifyInfoFragState clone() {
    return RectifyInfoFragState();
  }
}

RectifyInfoFragState initState(Map<String, dynamic> args) {
  return RectifyInfoFragState();
}
