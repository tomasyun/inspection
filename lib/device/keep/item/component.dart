import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record.dart';

import 'effect.dart';
import 'view.dart';

class RecordItemComponent extends Component<KeepRecord> {
  RecordItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
