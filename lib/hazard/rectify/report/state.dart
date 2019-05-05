import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class RectifyReportState implements Cloneable<RectifyReportState> {
  List<Asset> assets;

  @override
  RectifyReportState clone() {
    return RectifyReportState()..assets = assets;
  }
}

RectifyReportState initState(Map<String, dynamic> args) {
  RectifyReportState state = RectifyReportState();
  state.assets = [];
  return state;
}
