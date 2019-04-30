import 'package:fish_redux/fish_redux.dart';

class FilterState implements Cloneable<FilterState> {
  String flag;
  @override
  FilterState clone() {
    return FilterState()..flag = flag;
  }
}

FilterState initState(Map<String, dynamic> args) {
  FilterState state = FilterState();
  state.flag = args['flag'];
  return state;
}
