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
  addAttachment
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

  static Action onGetLevelRst(String level) {
    return Action(HazardReportAction.levelRst, payload: level);
  }

  static Action onGetTypeRst(String level) {
    return Action(HazardReportAction.typeRst, payload: level);
  }

  static Action onAddAttachmentClick() {
    return Action(HazardReportAction.addAttachment);
  }

  static Action onPickImages(List<Asset> assets) {
    return Action(HazardReportAction.images, payload: assets);
  }
}
