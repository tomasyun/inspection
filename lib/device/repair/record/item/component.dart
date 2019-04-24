import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';

import 'effect.dart';
import 'view.dart';

class RecordItemComponent extends Component<RepairRecord> {
  RecordItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
