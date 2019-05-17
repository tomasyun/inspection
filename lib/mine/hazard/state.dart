import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

class HazardHistoryState implements Cloneable<HazardHistoryState> {
  HazardModel model;
  @override
  HazardHistoryState clone() {
    return HazardHistoryState()..model = model;
  }
}

HazardHistoryState initState(Map<String, dynamic> args) {
  return HazardHistoryState();
}
