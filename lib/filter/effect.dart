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

  List<String> departs = ['陕西缔科网络科技有限公司', '通昱消防', '聚慧消防'];
  ctx.dispatch(FilterActionCreator.onGetDeparts(departs));
  List<String> applicants = ['黄骁', '贠拓', '高大陆', '王婷'];
  ctx.dispatch(FilterActionCreator.onGetApplicants(applicants));
}

void _onAction(Action action, Context<FilterState> ctx) {}
