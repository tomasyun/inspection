import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<FilterState> buildEffect() {
  return combineEffects(<Object, Effect<FilterState>>{
    Lifecycle.initState: _init,
    FilterAction.action: _onAction,
  });
}

void _init(Action action, Context<FilterState> ctx) {
  ctx.dispatch(FilterActionCreator.onInitContext(ctx.context));
  if (ctx.state.flag == 'level') {
    DicoHttpRepository.doGetHazardLevelRequest().then((model) {
      if (model.code == 0) {
        ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
      } else {
        AppCommons.showToast(model.msg);
      }
    });
  } else if (ctx.state.flag == 'type') {
    DicoHttpRepository.doGetHazardTypeRequest().then((model) {
      if (model.code == 0) {
        ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
      } else {
        AppCommons.showToast(model.msg);
      }
    });
  } else if (ctx.state.flag == 'depart') {
    DicoHttpRepository.doGetDepartsRequest().then((model) {
      if (model.code == 0) {
        ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
      } else {
        AppCommons.showToast(model.msg);
      }
    });
  } else if (ctx.state.flag == 'pic') {
    DicoHttpRepository.doGetPicRequest(ctx.state.departId).then((model) {
      if (model.code == 0) {
        ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
      } else {
        AppCommons.showToast(model.msg);
      }
    });
  } else if (ctx.state.flag == 'repairman') {
    DicoHttpRepository.doGetRepairManRequest().then((model) {
      if (model.code == 0) {
        ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
      } else {
        AppCommons.showToast(model.msg);
      }
    });
  }
}

void _onAction(Action action, Context<FilterState> ctx) {}
