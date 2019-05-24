import 'package:fish_redux/fish_redux.dart';

class MineState implements Cloneable<MineState> {
  Map<String, String> map = Map();

  @override
  MineState clone() {
    return MineState()..map = map;
  }
}

MineState initState(Map<String, dynamic> args) {
  MineState state = MineState();
  state.map['userName'] = '张三';
  state.map['company'] = '陕西缔科网络科技有限公司';
  return state;
}
