import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/warning_model.dart';

class WarningState implements Cloneable<WarningState> {
  List<WarningModel> list = List<WarningModel>();

  @override
  WarningState clone() {
    return WarningState()..list = list;
  }
}

WarningState initState(Map<String, dynamic> args) {
  return WarningState();
}
