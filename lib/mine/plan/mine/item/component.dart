import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

import 'effect.dart';
import 'view.dart';

class MinePlanItemComponent extends Component<PlanModel> {
  MinePlanItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
