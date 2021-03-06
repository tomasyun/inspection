import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//TODO replace with your own action
enum RectifyReportAction {
  action,
  addAttachment,
  images,
  report,
  form,
}

class RectifyReportActionCreator {
  static Action onAction() {
    return const Action(RectifyReportAction.action);
  }

  static Action onPickImages(List<Asset> assets) {
    return Action(RectifyReportAction.images, payload: assets);
  }

  static Action onAddAttachmentClick() {
    return Action(RectifyReportAction.addAttachment);
  }

  static Action onReport() {
    return Action(RectifyReportAction.report);
  }

  static Action onGetRectifyFormAction(Map<String, String> map) {
    return Action(
      RectifyReportAction.form,
      payload: map,
    );
  }
}
