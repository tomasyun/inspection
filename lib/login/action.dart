import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction {
  action,
  login,
  switchEye,
  eyeState,
}

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onLogin() {
    return Action(LoginAction.login);
  }

  static Action onSwitchEyeAction() {
    return Action(LoginAction.switchEye);
  }

  static Action onGetEyeStateAction(bool isClose) {
    return Action(LoginAction.eyeState, payload: isClose);
  }
}
