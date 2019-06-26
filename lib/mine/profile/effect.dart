import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<ProfileState> buildEffect() {
  return combineEffects(<Object, Effect<ProfileState>>{
    Lifecycle.initState: _onGetUserInfo,
    ProfileAction.action: _onAction,
  });
}

void _onAction(
  Action action,
  Context<ProfileState> ctx,
) {}

void _onGetUserInfo(
  Action action,
  Context<ProfileState> ctx,
) {
  DicoHttpRepository.doGetUserInfoRequest().then((model) {
    if (model.code == 0) {
      ctx.dispatch(ProfileActionCreator.onGetUserInfo(model));
    }
  });
}
