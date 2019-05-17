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
    if (state.model != null &&
        state.model.data != null &&
        state.model.data.isNotEmpty) {
      return state.model.data.map((item) {
        return ItemBean('hazardHistory', item);
      }).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(HazardHistoryState state, List<ItemBean> items) {}
}
