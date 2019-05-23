import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/equipment_info_model.dart';

class InfoState implements Cloneable<InfoState> {
  EquipmentInfoModel model;
  @override
  InfoState clone() {
    return InfoState()..model = model;
  }
}

InfoState initState(Map<String, dynamic> args) {
  return InfoState();
}
