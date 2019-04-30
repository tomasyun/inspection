import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReviewInfoFragAction { action }

class ReviewInfoFragActionCreator {
  static Action onAction() {
    return const Action(ReviewInfoFragAction.action);
  }
}
