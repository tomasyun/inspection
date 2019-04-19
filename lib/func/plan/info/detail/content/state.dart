import 'package:fish_redux/fish_redux.dart';

class ContentState implements Cloneable<ContentState> {
  @override
  ContentState clone() {
    return ContentState();
  }
}

ContentState initState(Map<String, dynamic> args) {
  return ContentState();
}
