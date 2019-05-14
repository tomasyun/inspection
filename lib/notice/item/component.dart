import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

import 'effect.dart';
import 'view.dart';

class NoticeItemComponent extends Component<NoticeModel> {
  NoticeItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<NoticeModel>(
              adapter: null, slots: <String, Dependent<NoticeModel>>{}),
        );
}
