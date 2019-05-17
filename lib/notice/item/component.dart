import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

import 'effect.dart';
import 'view.dart';

class NoticeItemComponent extends Component<Data> {
  NoticeItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
