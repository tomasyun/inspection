import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/hazard/item/component.dart';
import 'package:inspection/mine/hazard/state.dart';

class HazardHistoryAdapter extends DynamicFlowAdapter<HazardHistoryState> {
  HazardHistoryAdapter()
      : super(
          pool: <String, Component<Object>>{
            'hazardHistory': HistoryItemComponent()
          },
          connector: _HazardHistoryConnector(),
        );
}

class _HazardHistoryConnector
    extends ConnOp<HazardHistoryState, List<ItemBean>> {
  @override
  List<ItemBean> get(HazardHistoryState state) {
    return state.list.map((item) {
      return ItemBean('hazardHistory', item);
    }).toList();
  }

  @override
  void set(HazardHistoryState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
