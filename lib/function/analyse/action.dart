import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SaveAnalyseAction { action }

class SaveAnalyseActionCreator {
  static Action onAction() {
    return const Action(SaveAnalyseAction.action);
  }
}
