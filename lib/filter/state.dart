import 'package:fish_redux/fish_redux.dart';

class FilterState implements Cloneable<FilterState> {
  String flag;
  List<String> levels;
  @override
  FilterState clone() {
    return FilterState()
      ..flag = flag
      ..levels = levels;
  }
}

FilterState initState(Map<String, dynamic> args) {
  FilterState state = FilterState();
  state.flag = args['flag'];
  return state;
}
