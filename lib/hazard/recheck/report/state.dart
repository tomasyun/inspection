import 'package:fish_redux/fish_redux.dart';

class RecheckReportState implements Cloneable<RecheckReportState> {

  @override
  RecheckReportState clone() {
    return RecheckReportState();
  }
}

RecheckReportState initState(Map<String, dynamic> args) {
  return RecheckReportState();
}
