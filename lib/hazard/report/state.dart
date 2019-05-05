import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HazardReportState implements Cloneable<HazardReportState> {
  String levelRst;
  String typeRst;
  List<Asset> assets;

  @override
  HazardReportState clone() {
    return HazardReportState()
      ..levelRst = levelRst
      ..typeRst = typeRst
      ..assets = assets;
  }
}

HazardReportState initState(Map<String, dynamic> args) {
  HazardReportState state = HazardReportState();
  state.levelRst = '等级';
  state.typeRst = '类型';
  state.assets = [];
  return state;
}
