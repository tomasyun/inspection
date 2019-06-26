import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReportAction {
  action,
  depart,
  repairman,
  departRst,
  pic,
  report,
  goBack,
  picRst,
  repairmanRst,
  repairDate,
  repairDateRst,
  deviceInfo,
  scanQRCode,
}

class ReportActionCreator {
  static Action onAction() {
    return const Action(ReportAction.action);
  }

  static Action onShowRepairDate() {
    return Action(ReportAction.repairDate);
  }

  static Action onDepartSkipFilter() {
    return Action(ReportAction.depart);
  }

  static Action onRepairManSkipFilter() {
    return Action(ReportAction.repairman);
  }

  static Action onPicSkipFilter() {
    return Action(ReportAction.pic);
  }

  static Action onGetDepartRst(Map<String, String> map) {
    return Action(
      ReportAction.departRst,
      payload: map,
    );
  }

  static Action onGetPicRst(Map<String, String> map) {
    return Action(
      ReportAction.picRst,
      payload: map,
    );
  }

  static Action onGetRepairManRst(Map<String, String> map) {
    return Action(
      ReportAction.repairmanRst,
      payload: map,
    );
  }

  static Action onGetRepairDateRst(String repairDate) {
    return Action(
      ReportAction.repairDateRst,
      payload: repairDate,
    );
  }

  static Action onReport() {
    return Action(ReportAction.report);
  }

  static Action onGoBack() {
    return Action(ReportAction.goBack);
  }

  static Action onScanQRCodeAction() {
    return Action(ReportAction.scanQRCode);
  }

  static Action onGetDeviceInfo(Map<String, String> map) {
    return Action(
      ReportAction.deviceInfo,
      payload: map,
    );
  }
}
