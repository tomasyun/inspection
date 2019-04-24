import 'package:fish_redux/fish_redux.dart';

class ReportState implements Cloneable<ReportState> {
  @override
  ReportState clone() {
    return ReportState();
  }
}

ReportState initState(Map<String, dynamic> args) {
  return ReportState();
}
