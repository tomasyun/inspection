import 'package:fish_redux/fish_redux.dart';

class HazardInfoState implements Cloneable<HazardInfoState> {
  String state;

  @override
  HazardInfoState clone() {
    return HazardInfoState()..state = state;
  }
}

HazardInfoState initState(Map<String, dynamic> args) {
  HazardInfoState state = HazardInfoState();
  state.state = args['state'];
  return state;
}
