import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    QRScanState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("QR Scanner"),
      centerTitle: true,
    ),
    body: Center(
      child: Text(state.result ?? ""),
    ),
  );
}
