import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_info_model.dart';

class HazardInfoState implements Cloneable<HazardInfoState> {
  String state;
  String id;
  HazardInfoModel model;

  @override
  HazardInfoState clone() {
    return HazardInfoState()
      ..state = state
      ..id = id
      ..model = model;
  }
}

HazardInfoState initState(Map<String, dynamic> args) {
  HazardInfoState state = HazardInfoState();
  state.state = args['state'];
  state.id = args['id'];
  return state;
}
