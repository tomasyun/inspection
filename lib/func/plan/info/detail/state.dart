import 'package:fish_redux/fish_redux.dart';

class DetailState implements Cloneable<DetailState> {
  @override
  DetailState clone() {
    return DetailState();
  }
}

DetailState initState(Map<String, dynamic> args) {
  return DetailState();
}
