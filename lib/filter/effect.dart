import 'package:fish_redux/fish_redux.dart';

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
  List<String> levels = ['中等级', '高等级', '低等级'];
  ctx.dispatch(FilterActionCreator.onGetLevels(levels));
  List<String> types = ['故障隐患', '报废隐患', '消防塞堵塞隐患'];
  ctx.dispatch(FilterActionCreator.onGetTypes(types));
}

void _onAction(Action action, Context<FilterState> ctx) {}
