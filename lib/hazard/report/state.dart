import 'package:fish_redux/fish_redux.dart';

class HazardReportState implements Cloneable<HazardReportState> {
  @override
  HazardReportState clone() {
    return HazardReportState();
  }
}

HazardReportState initState(Map<String, dynamic> args) {
  return HazardReportState();
}
