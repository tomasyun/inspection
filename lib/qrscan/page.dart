import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class QRScanPage extends Page<QRScanState, Map<String, dynamic>> {
  QRScanPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<QRScanState>(
              adapter: null, slots: <String, Dependent<QRScanState>>{}),
          middleware: <Middleware<QRScanState>>[],
        );
}
