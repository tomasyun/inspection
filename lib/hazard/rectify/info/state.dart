import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/rectify_info_model.dart';

class RectifyInfoState implements Cloneable<RectifyInfoState> {
  String id;
  RectifyInfoModel model;
  @override
  RectifyInfoState clone() {
    return RectifyInfoState()
      ..id = id
      ..model = model;
  }
}

RectifyInfoState initState(Map<String, dynamic> args) {
  RectifyInfoState state = RectifyInfoState();
  state.id = args['id'];
  return state;
}
