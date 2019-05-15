import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/plan/manage/item/component.dart';
import 'package:inspection/mine/plan/manage/state.dart';

class InspectPlanAdapter extends DynamicFlowAdapter<InspectPlanState> {
  InspectPlanAdapter()
      : super(
          pool: <String, Component<Object>>{'plan': InspectPlanItemComponent()},
          connector: _InspectPlanConnector(),
        );
}

class _InspectPlanConnector extends ConnOp<InspectPlanState, List<ItemBean>> {
  @override
  List<ItemBean> get(InspectPlanState state) {
    return state.list.map((item) {
      return ItemBean('plan', item);
    }).toList();
  }

  @override
  void set(InspectPlanState state, List<ItemBean> items) {}
}
