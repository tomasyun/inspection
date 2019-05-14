import 'package:fish_redux/fish_redux.dart';

class SaveAnalyseState implements Cloneable<SaveAnalyseState> {
  @override
  SaveAnalyseState clone() {
    return SaveAnalyseState();
  }
}

SaveAnalyseState initState(Map<String, dynamic> args) {
  return SaveAnalyseState();
}
