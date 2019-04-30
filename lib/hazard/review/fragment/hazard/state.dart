import 'package:fish_redux/fish_redux.dart';

class HazardInfoFragState implements Cloneable<HazardInfoFragState> {
  @override
  HazardInfoFragState clone() {
    return HazardInfoFragState();
  }
}

HazardInfoFragState initState(Map<String, dynamic> args) {
  return HazardInfoFragState();
}
