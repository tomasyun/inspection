import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(InfoState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Center(
      child: stateView.blackPage(),
    ),
  );
}
