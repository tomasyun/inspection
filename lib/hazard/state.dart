import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

class HazardState implements Cloneable<HazardState> {
  List<HazardModel> list = List<HazardModel>();

  @override
  HazardState clone() {
    return HazardState()..list = list;
  }
}

HazardState initState(Map<String, dynamic> args) {
  return HazardState();
}
