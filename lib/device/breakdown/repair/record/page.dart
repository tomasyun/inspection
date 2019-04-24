import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/breakdown/repair/record/list_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//维修记录
class RecordPage extends Page<RecordState, Map<String, dynamic>> {
  RecordPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies:
                Dependencies<RecordState>(adapter: RepairRecordAdapter()));
}
