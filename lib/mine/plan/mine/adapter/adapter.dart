import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/plan/mine/item/component.dart';
import 'package:inspection/mine/plan/mine/state.dart';

class MinePlanAdapter extends DynamicFlowAdapter<MinePlanState> {
  MinePlanAdapter()
      : super(
          pool: <String, Component<Object>>{'plan': MinePlanItemComponent()},
          connector: _MinePlanConnector(),
        );
}

class _MinePlanConnector extends ConnOp<MinePlanState, List<ItemBean>> {
  @override
  List<ItemBean> get(MinePlanState state) {
    if (state.model != null && state.model.data != null) {
      return state.model.data.map((item) {
        return ItemBean('plan', item);
      }).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(MinePlanState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
