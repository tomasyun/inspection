import 'package:fish_redux/fish_redux.dart';

class ReportRecordState implements Cloneable<ReportRecordState> {
  @override
  ReportRecordState clone() {
    return ReportRecordState();
  }
}

ReportRecordState initState(Map<String, dynamic> args) {
  return ReportRecordState();
}
