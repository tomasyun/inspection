import 'package:fish_redux/fish_redux.dart';

class ProfileState implements Cloneable<ProfileState> {
  @override
  ProfileState clone() {
    return ProfileState();
  }
}

ProfileState initState(Map<String, dynamic> args) {
  return ProfileState();
}
