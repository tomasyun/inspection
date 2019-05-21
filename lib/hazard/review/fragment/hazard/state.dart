import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_info_model.dart';

class HazardInfoFragState implements Cloneable<HazardInfoFragState> {
  String id;
  HazardInfoModel model;
  @override
  HazardInfoFragState clone() {
    return HazardInfoFragState()
      ..id = id
      ..model = model;
  }
}

HazardInfoFragState initState(Map<String, dynamic> args) {
  HazardInfoFragState state = HazardInfoFragState();
  state.id = args['id'];
  return state;
}
