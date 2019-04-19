import 'package:fish_redux/fish_redux.dart';

class DeviceState implements Cloneable<DeviceState> {
  @override
  DeviceState clone() {
    return DeviceState();
  }
}

DeviceState initState(Map<String, dynamic> args) {
  return DeviceState();
}
