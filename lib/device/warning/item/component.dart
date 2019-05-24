import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/warning_model.dart';

import 'effect.dart';
import 'view.dart';

class WarningItemComponent extends Component<Data> {
  WarningItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
