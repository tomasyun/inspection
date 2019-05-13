import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/notice/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//通知
class NoticePage extends Page<NoticeState, Map<String, dynamic>> {
  NoticePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<NoticeState>(
            adapter: NoticeAdapter(),
          ),
        );
}
