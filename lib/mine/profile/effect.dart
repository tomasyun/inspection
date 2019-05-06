import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/user_model.dart';

import 'action.dart';
import 'state.dart';

Effect<ProfileState> buildEffect() {
  return combineEffects(<Object, Effect<ProfileState>>{
    Lifecycle.initState: _onGetUserInfo,
    ProfileAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ProfileState> ctx) {}

void _onGetUserInfo(Action action, Context<ProfileState> ctx) {
  UserModel model = UserModel(
      userName: 'o,耶斯',
      name: '贠拓',
      avatar: 'images/ic_avatar.png',
      company: '陕西缔科网络科技有限公司',
      depart: '研发部');
  ctx.dispatch(ProfileActionCreator.onGetUserInfo(model));
}
