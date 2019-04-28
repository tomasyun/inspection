import 'package:fish_redux/fish_redux.dart';

class CostApplyState implements Cloneable<CostApplyState> {
  @override
  CostApplyState clone() {
    return CostApplyState();
  }
}

CostApplyState initState(Map<String, dynamic> args) {
  return CostApplyState();
}
