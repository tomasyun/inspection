import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/warning/item/component.dart';
import 'package:inspection/device/warning/state.dart';

class WarningAdapter extends DynamicFlowAdapter<WarningState> {
  WarningAdapter()
      : super(
          pool: <String, Component<Object>>{'warning': WarningItemComponent()},
          connector: _WarningConnector(),
        );
}

class _WarningConnector extends ConnOp<WarningState, List<ItemBean>> {
  @override
  List<ItemBean> get(WarningState state) {
    return state.model != null && state.model.data != null
        ? state.model.data.map((item) {
      return ItemBean('warning', item);
    }).toList()
        : <ItemBean>[];
  }

  @override
  void set(WarningState state, List<ItemBean> items) {}
}
