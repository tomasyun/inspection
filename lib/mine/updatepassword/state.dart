import 'package:fish_redux/fish_redux.dart';

class UpdatePasswordState implements Cloneable<UpdatePasswordState> {
  @override
  UpdatePasswordState clone() {
    return UpdatePasswordState();
  }
}

UpdatePasswordState initState(Map<String, dynamic> args) {
  return UpdatePasswordState();
}
