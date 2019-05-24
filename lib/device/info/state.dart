import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/equipment_info_model.dart';

class InfoState implements Cloneable<InfoState> {
  EquipmentInfoModel model;
  String equipmentId;
  @override
  InfoState clone() {
    return InfoState()
      ..model = model
      ..equipmentId;
  }
}

InfoState initState(Map<String, dynamic> args) {
  InfoState state = InfoState();
  state.equipmentId = '';
  return state;
}
