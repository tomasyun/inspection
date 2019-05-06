import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/user_model.dart';

class ProfileState implements Cloneable<ProfileState> {
  UserModel model;
  @override
  ProfileState clone() {
    return ProfileState()..model = model;
  }
}

ProfileState initState(Map<String, dynamic> args) {
  return ProfileState();
}
