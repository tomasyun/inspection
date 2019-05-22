import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record_model.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    RecordItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<Data> ctx) {}
