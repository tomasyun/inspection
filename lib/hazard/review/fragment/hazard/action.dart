import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardInfoFragAction { action }

class HazardInfoFragActionCreator {
  static Action onAction() {
    return const Action(HazardInfoFragAction.action);
  }
}
