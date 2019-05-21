import 'package:fish_redux/fish_redux.dart';

class ReviewState implements Cloneable<ReviewState> {
  String id;
  @override
  ReviewState clone() {
    return ReviewState()..id = id;
  }
}

ReviewState initState(Map<String, dynamic> args) {
  ReviewState state = ReviewState();
  state.id = args['id'];
  return state;
}
