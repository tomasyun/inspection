import 'package:fish_redux/fish_redux.dart';
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
      ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
    });
  } else if (ctx.state.flag == 'type') {
    DicoHttpRepository.doGetHazardTypeRequest().then((model) {
      ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
    });
  } else if (ctx.state.flag == 'depart') {
    DicoHttpRepository.doGetDepartsRequest().then((model) {
      ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
    });
  } else if (ctx.state.flag == 'pic') {
    DicoHttpRepository.doGetPicRequest(ctx.state.departId).then((model) {
      ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
    });
  } else if (ctx.state.flag == 'repairman') {
    DicoHttpRepository.doGetRepairManRequest().then((model) {
      ctx.dispatch(FilterActionCreator.onGetFilterModel(model));
    });
  }
}

void _onAction(Action action, Context<FilterState> ctx) {}
