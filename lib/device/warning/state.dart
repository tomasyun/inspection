import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/warning_model.dart';

class WarningState implements Cloneable<WarningState> {
  WarningModel model;

  @override
  WarningState clone() {
    return WarningState()..model = model;
  }
}

WarningState initState(Map<String, dynamic> args) {
  return WarningState();
}
