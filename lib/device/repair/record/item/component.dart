import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record_model.dart';

import 'effect.dart';
import 'view.dart';

class RecordItemComponent extends Component<Data> {
  RecordItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
