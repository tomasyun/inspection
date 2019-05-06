import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/user_model.dart';

//TODO replace with your own action
enum ProfileAction { action, userInfo }

class ProfileActionCreator {
  static Action onAction() {
    return const Action(ProfileAction.action);
  }

  static Action onGetUserInfo(UserModel model) {
    return Action(ProfileAction.userInfo, payload: model);
  }
}
