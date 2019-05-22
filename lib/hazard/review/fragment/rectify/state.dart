import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/rectify_info_model.dart';

class RectifyInfoFragState implements Cloneable<RectifyInfoFragState> {
  String id;
  RectifyInfoModel model;

  @override
  RectifyInfoFragState clone() {
    return RectifyInfoFragState()
      ..id = id
      ..model = model;
  }
}

RectifyInfoFragState initState(Map<String, dynamic> args) {
  RectifyInfoFragState state = RectifyInfoFragState();
  state.id = args['id'];
  return state;
}
