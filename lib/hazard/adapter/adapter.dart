import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/hazard/item/component.dart';
import 'package:inspection/hazard/state.dart';

class HazardAdapter extends DynamicFlowAdapter<HazardState> {
  HazardAdapter()
      : super(
          pool: <String, Component<Object>>{'hazard': HazardItemComponent()},
          connector: _HazardConnector(),
        );
}

class _HazardConnector extends ConnOp<HazardState, List<ItemBean>> {
  @override
  List<ItemBean> get(HazardState state) {
    return state.list.map((item) {
      return ItemBean('hazard', item);
    }).toList();
  }

  @override
  void set(HazardState state, List<ItemBean> items) {}
}
