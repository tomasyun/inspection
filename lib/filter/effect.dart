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
  List<String> levels = ['中等级', '高等级', '低等级'];
  ctx.dispatch(FilterActionCreator.onGetLevels(levels));
}

void _onAction(Action action, Context<FilterState> ctx) {}
