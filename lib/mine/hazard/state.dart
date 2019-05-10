import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

class HazardHistoryState implements Cloneable<HazardHistoryState> {
  List<HazardModel> list = List<HazardModel>();
  @override
  HazardHistoryState clone() {
    return HazardHistoryState()..list = list;
  }
}

HazardHistoryState initState(Map<String, dynamic> args) {
  return HazardHistoryState();
}
