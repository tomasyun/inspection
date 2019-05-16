import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

//TODO replace with your own action
enum HazardAction {
  init,
  action,
  selectStartDate,
  selectState,
  startDate,
  endDate,
  selectEndDate,
  state,
}

class HazardActionCreator {
  static Action onAction() {
    return const Action(HazardAction.action);
  }

  static Action onSelectStartDate() {
    return Action(HazardAction.selectStartDate);
  }

  static Action onSelectEndDate() {
    return Action(HazardAction.selectEndDate);
  }

  static Action onInitHazardListData(List<HazardModel> list) {
    return Action(HazardAction.init, payload: list);
  }

  static Action onSelectState() {
    return Action(HazardAction.selectState);
  }

  static Action getStartDate(String date) {
    return Action(HazardAction.startDate, payload: date);
  }

  static Action getEndDate(String date) {
    return Action(HazardAction.endDate, payload: date);
  }

  static Action getHazardState(String state) {
    return Action(HazardAction.state, payload: state);
  }
}
