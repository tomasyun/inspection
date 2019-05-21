import 'package:fish_redux/fish_redux.dart';

class RecheckInfoFragState implements Cloneable<RecheckInfoFragState> {
  String id;
  @override
  RecheckInfoFragState clone() {
    return RecheckInfoFragState()..id = id;
  }
}

RecheckInfoFragState initState(Map<String, dynamic> args) {
  RecheckInfoFragState state = RecheckInfoFragState();
  state.id = args['id'];
  return state;
}
