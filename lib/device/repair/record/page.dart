import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/repair/record/effect.dart';
import 'package:inspection/device/repair/record/list_adapter/adapter.dart';
import 'package:inspection/device/repair/record/reducer.dart';
import 'package:inspection/device/repair/record/state.dart';
import 'package:inspection/device/repair/record/view.dart';

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
