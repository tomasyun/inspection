import 'package:fish_redux/fish_redux.dart';

class HazardInfoState implements Cloneable<HazardInfoState> {
  String state;
  @override
  HazardInfoState clone() {
    return HazardInfoState()..state = state;
  }
}

HazardInfoState initState(Map<String, dynamic> args) {
  return HazardInfoState()..state = args['state'];
}
