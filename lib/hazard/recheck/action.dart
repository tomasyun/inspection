import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//TODO replace with your own action
enum RecheckReportAction { action, addAttachment, images, report, formId }

class RecheckReportActionCreator {
  static Action onAction() {
    return const Action(RecheckReportAction.action);
  }

  static Action onAddAttachment() {
    return Action(RecheckReportAction.addAttachment);
  }

  static Action onPickImages(List<Asset> images) {
    return Action(RecheckReportAction.images, payload: images);
  }

  static Action onReport() {
    return Action(RecheckReportAction.report);
  }

  static Action onGetRecheckFormId(String formId) {
    return Action(RecheckReportAction.formId, payload: formId);
  }
}
