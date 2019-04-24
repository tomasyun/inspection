import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/keep/state.dart';

class KeepRecordAdapter extends DynamicFlowAdapter<KeepState> {
  KeepRecordAdapter()
      : super(
          pool: <String, Component<Object>>{},
          connector: _KeepRecordConnector(),
        );
}

class _KeepRecordConnector extends ConnOp<KeepState, List<ItemBean>> {
  @override
  List<ItemBean> get(KeepState state) {
    return <ItemBean>[];
  }

  @override
  void set(KeepState state, List<ItemBean> items) {}
}
