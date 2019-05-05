import 'package:fish_redux/fish_redux.dart';

class HazardReportState implements Cloneable<HazardReportState> {
  String levelRst;
  String typeRst;

  @override
  HazardReportState clone() {
    return HazardReportState()
      ..levelRst = levelRst
      ..typeRst = typeRst;
  }
}

HazardReportState initState(Map<String, dynamic> args) {
  HazardReportState state = HazardReportState();
  state.levelRst = '等级';
  state.typeRst = '类型';
  return state;
}
