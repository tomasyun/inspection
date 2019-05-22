import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/repair/record/item/component.dart';
import 'package:inspection/device/repair/record/state.dart';

class RepairRecordAdapter extends DynamicFlowAdapter<RecordState> {
  RepairRecordAdapter()
      : super(
          pool: <String, Component<Object>>{'record': RecordItemComponent()},
          connector: _RepairRecordConnector(),
        );
}

class _RepairRecordConnector extends ConnOp<RecordState, List<ItemBean>> {
  @override
  List<ItemBean> get(RecordState state) {
    return state.model != null && state.model.data != null
        ? state.model.data.map((item) {
            return ItemBean('record', item);
          }).toList()
        : <ItemBean>[];
  }

  @override
  void set(RecordState state, List<ItemBean> items) {}
}
