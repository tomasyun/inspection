import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/notice/item/component.dart';
import 'package:inspection/notice/state.dart';

class NoticeAdapter extends DynamicFlowAdapter<NoticeState> {
  NoticeAdapter()
      : super(
          pool: <String, Component<Object>>{'notice': NoticeItemComponent()},
          connector: _NoticeConnector(),
        );
}

class _NoticeConnector extends ConnOp<NoticeState, List<ItemBean>> {
  @override
  List<ItemBean> get(NoticeState state) {
    if (state.model != null && state.model.data != null) {
      return state.model.data.map((item) {
        return ItemBean('notice', item);
      }).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(NoticeState state, List<ItemBean> items) {}
}
