import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/rectify_info_model.dart';

//TODO replace with your own action
enum RectifyInfoFragAction { action, model }

class RectifyInfoFragActionCreator {
  static Action onAction() {
    return const Action(RectifyInfoFragAction.action);
  }

  static Action onGetRectifyInfoModel(RectifyInfoModel model) {
    return Action(RectifyInfoFragAction.model, payload: model);
  }
}
