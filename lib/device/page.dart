import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

//设备相关
class DevicePage extends Page<DeviceState, Map<String, dynamic>> {
  DevicePage()
      : super(
          initState: initState,
          view: buildView,
          dependencies: Dependencies<DeviceState>(
              adapter: null, slots: <String, Dependent<DeviceState>>{}),
          middleware: <Middleware<DeviceState>>[],
        );
}
