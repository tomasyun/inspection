import 'package:fish_redux/fish_redux.dart';

class ReviewState implements Cloneable<ReviewState> {
  @override
  ReviewState clone() {
    return ReviewState();
  }
}

ReviewState initState(Map<String, dynamic> args) {
  return ReviewState();
}
