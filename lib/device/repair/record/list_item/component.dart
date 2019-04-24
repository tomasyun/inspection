import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';

import 'effect.dart';
import 'view.dart';

class RecordComponent extends Component<RepairRecord> {
  RecordComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
