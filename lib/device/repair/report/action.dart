import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReportAction {
  action,
  depart,
  repairman,
  departRst,
  pic,
  applicantRst,
  report,
  goBack
}

class ReportActionCreator {
  static Action onAction() {
    return const Action(ReportAction.action);
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

  static Action onGetDepartRst(String departRst) {
    return Action(ReportAction.departRst, payload: departRst);
  }

  static Action onGetApplicantRst(String applicantRst) {
    return Action(ReportAction.applicantRst, payload: applicantRst);
  }

  static Action onReport() {
    return Action(ReportAction.report);
  }

  static Action onGoBack() {
    return Action(ReportAction.goBack);
  }
}
