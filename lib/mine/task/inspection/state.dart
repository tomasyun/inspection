import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/inspect_content_model.dart';

class InspectionTaskState implements Cloneable<InspectionTaskState> {
  Map<String, String> map = Map();
  InspectContentModel model;
  String equipmentId;

  @override
  InspectionTaskState clone() {
    return InspectionTaskState()
      ..map = map
      ..equipmentId = equipmentId
      ..model = model;
  }
}

InspectionTaskState initState(Map<String, dynamic> args) {
  InspectionTaskState state = InspectionTaskState();
  state.map['deviceId'] = '';
  state.map['deviceName'] = '';
  state.map['deviceTypeId'] = '';
  state.map['planId'] = '';
  state.equipmentId = args['equipmentId'];
  return state;
}
