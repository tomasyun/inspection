import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/recheck_info_model.dart';

class RecheckInfoFragState implements Cloneable<RecheckInfoFragState> {
  String id;
  RecheckInfoModel model;
  @override
  RecheckInfoFragState clone() {
    return RecheckInfoFragState()
      ..id = id
      ..model = model;
  }
}

RecheckInfoFragState initState(Map<String, dynamic> args) {
  RecheckInfoFragState state = RecheckInfoFragState();
  state.id = args['id'];
  return state;
}
