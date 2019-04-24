import 'package:fish_redux/fish_redux.dart';

class RectifyReportState implements Cloneable<RectifyReportState> {
  @override
  RectifyReportState clone() {
    return RectifyReportState();
  }
}

RectifyReportState initState(Map<String, dynamic> args) {
  return RectifyReportState();
}
