import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/repair/record/list_item/component.dart';
import 'package:inspection/device/repair/record/state.dart';

class RepairRecordAdapter extends DynamicFlowAdapter<RecordState> {
  RepairRecordAdapter()
      : super(
          pool: <String, Component<Object>>{'record': RecordComponent()},
          connector: _RepairRecordConnector(),
        );
}

class _RepairRecordConnector extends ConnOp<RecordState, List<ItemBean>> {
  @override
  List<ItemBean> get(RecordState state) {
    return state.list.map((item) {
      return ItemBean('record', item);
    }).toList();
  }

  @override
  void set(RecordState state, List<ItemBean> items) {}
}
