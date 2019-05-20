import 'package:fish_redux/fish_redux.dart';

class HazardInfoState implements Cloneable<HazardInfoState> {
  String state;
  String id;

  @override
  HazardInfoState clone() {
    return HazardInfoState()
      ..state = state
      ..id = id;
  }
}

HazardInfoState initState(Map<String, dynamic> args) {
  HazardInfoState state = HazardInfoState();
  state.state = args['state'];
  state.id = args['id'];
  return state;
}
