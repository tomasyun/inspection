import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

import 'effect.dart';
import 'view.dart';

class PlanAboutItemComponent extends Component<Data> {
  PlanAboutItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
