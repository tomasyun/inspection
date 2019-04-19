import 'package:fish_redux/fish_redux.dart';

class RecheckState implements Cloneable<RecheckState> {
  @override
  RecheckState clone() {
    return RecheckState();
  }
}

RecheckState initState(Map<String, dynamic> args) {
  return RecheckState();
}
