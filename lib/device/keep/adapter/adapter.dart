import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/keep/item/component.dart';
import 'package:inspection/device/keep/state.dart';

class KeepRecordAdapter extends DynamicFlowAdapter<KeepState> {
  KeepRecordAdapter()
      : super(
          pool: <String, Component<Object>>{
            'keep_record': RecordItemComponent()
          },
          connector: _KeepRecordConnector(),
        );
}

class _KeepRecordConnector extends ConnOp<KeepState, List<ItemBean>> {
  @override
  List<ItemBean> get(KeepState state) {
    return state.model != null && state.model.data != null
        ? state.model.data.map((item) {
            return ItemBean('keep_record', item);
          }).toList()
        : <ItemBean>[];
  }

  @override
  void set(KeepState state, List<ItemBean> items) {}
}
