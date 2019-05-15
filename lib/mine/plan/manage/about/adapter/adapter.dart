import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/plan/manage/about/item/component.dart';
import 'package:inspection/mine/plan/manage/about/state.dart';

class PlanAboutAdapter extends DynamicFlowAdapter<PlanAboutState> {
  PlanAboutAdapter()
      : super(
          pool: <String, Component<Object>>{'about': PlanAboutItemComponent()},
          connector: _PlanAboutConnector(),
        );
}

class _PlanAboutConnector extends ConnOp<PlanAboutState, List<ItemBean>> {
  @override
  List<ItemBean> get(PlanAboutState state) {
    return state.list.map((item) {
      return ItemBean('about', item);
    }).toList();
  }

  @override
  void set(PlanAboutState state, List<ItemBean> items) {}
}
