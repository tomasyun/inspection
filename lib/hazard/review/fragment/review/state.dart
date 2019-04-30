import 'package:fish_redux/fish_redux.dart';

class ReviewInfoFragState implements Cloneable<ReviewInfoFragState> {
  @override
  ReviewInfoFragState clone() {
    return ReviewInfoFragState();
  }
}

ReviewInfoFragState initState(Map<String, dynamic> args) {
  return ReviewInfoFragState();
}
