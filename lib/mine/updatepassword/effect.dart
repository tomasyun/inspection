import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<UpdatePasswordState> buildEffect() {
  return combineEffects(<Object, Effect<UpdatePasswordState>>{
    UpdatePasswordAction.action: _onAction,
    UpdatePasswordAction.update: _onUpdate,
  });
}

void _onAction(Action action, Context<UpdatePasswordState> ctx) {}

void _onUpdate(Action action, Context<UpdatePasswordState> ctx) {
  if (ctx.state.oldPasswordController.text.isEmpty) {
    AppCommons.showToast('请输入原密码');
  } else if (ctx.state.newPasswordController.text.isEmpty) {
    AppCommons.showToast('请输入新密码');
  } else if (ctx.state.againPasswordController.text.isEmpty) {
    AppCommons.showToast('请再次输入新密码');
  } else {
    FormData data = FormData.from({
      'newPassword': ctx.state.newPasswordController.text,
      'oldPassword': ctx.state.oldPasswordController.text
    });
    DicoHttpRepository.doUpdatePasswordRequest(data).then((value) {
      AppCommons.showToast(value['msg']);
    });
  }
}
