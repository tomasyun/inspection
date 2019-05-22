import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

import 'effect.dart';
import 'view.dart';

class InspectPlanItemComponent extends Component<Data> {
  InspectPlanItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
