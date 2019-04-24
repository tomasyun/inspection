import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class RecordItemComponent extends Component<RecordItemState> {
  RecordItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
