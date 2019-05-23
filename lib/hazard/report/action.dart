import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//TODO replace with your own action
enum HazardReportAction {
  action,
  level,
  type,
  levelRst,
  typeRst,
  images,
  addAttachment,
  report,
  scanQRCode,
  deviceInfo,
}

class HazardReportActionCreator {
  static Action onAction() {
    return const Action(HazardReportAction.action);
  }

  static Action onLevelSkipFilter() {
    return Action(HazardReportAction.level);
  }

  static Action onTypeSkipFilter() {
    return Action(HazardReportAction.type);
  }

  static Action onGetLevelRst(Map<String, String> map) {
    return Action(HazardReportAction.levelRst, payload: map);
  }

  static Action onGetTypeRst(Map<String, String> map) {
    return Action(HazardReportAction.typeRst, payload: map);
  }

  static Action onAddAttachmentClick() {
    return Action(HazardReportAction.addAttachment);
  }

  static Action onPickImages(List<Asset> assets) {
    return Action(HazardReportAction.images, payload: assets);
  }

  static Action onReport() {
    return Action(HazardReportAction.report);
  }

  static Action onScanQRCode() {
    return Action(HazardReportAction.scanQRCode);
  }

  static Action onDeviceCodeAction(Map<String, String> map) {
    return Action(HazardReportAction.deviceInfo, payload: map);
  }
}
