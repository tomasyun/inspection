import 'package:fish_redux/fish_redux.dart';

class QRScanState implements Cloneable<QRScanState> {
  String result;
  @override
  QRScanState clone() {
    return QRScanState()..result = this.result;
  }
}

QRScanState initState(Map<String, dynamic> args) {
  return QRScanState();
}
