import 'package:fish_redux/fish_redux.dart';

class HazardInfoState implements Cloneable<HazardInfoState> {
  @override
  HazardInfoState clone() {
    return HazardInfoState();
  }
}

HazardInfoState initState(Map<String, dynamic> args) {
  return HazardInfoState();
}
