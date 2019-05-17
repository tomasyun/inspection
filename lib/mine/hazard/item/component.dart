import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

import 'effect.dart';
import 'view.dart';

class HistoryItemComponent extends Component<Data> {
  HistoryItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
