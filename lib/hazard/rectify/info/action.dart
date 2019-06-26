import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/rectify_info_model.dart';

//TODO replace with your own action
enum RectifyInfoAction { action, info }

class RectifyInfoActionCreator {
  static Action onAction() {
    return const Action(RectifyInfoAction.action);
  }

  static Action onGetRectifyInfoAction(RectifyInfoModel model) {
    return Action(
      RectifyInfoAction.info,
      payload: model,
    );
  }
}
