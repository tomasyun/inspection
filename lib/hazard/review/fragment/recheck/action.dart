import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/recheck_info_model.dart';

//TODO replace with your own action
enum RecheckInfoFragAction { action, model }

class RecheckInfoFragActionCreator {
  static Action onAction() {
    return const Action(RecheckInfoFragAction.action);
  }

  static Action onGetRecheckInfoModel(RecheckInfoModel model) {
    return Action(RecheckInfoFragAction.model, payload: model);
  }
}
