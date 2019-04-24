import 'package:fish_redux/fish_redux.dart';

class RecheckInfoState implements Cloneable<RecheckInfoState> {
  @override
  RecheckInfoState clone() {
    return RecheckInfoState();
  }
}

RecheckInfoState initState(Map<String, dynamic> args) {
  return RecheckInfoState();
}
