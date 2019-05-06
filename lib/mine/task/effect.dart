import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/todos_model.dart';

import 'action.dart';
import 'state.dart';

Effect<TaskState> buildEffect() {
  return combineEffects(<Object, Effect<TaskState>>{
    Lifecycle.initState: _onGetToDos,
    TaskAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TaskState> ctx) {}

void _onGetToDos(Action action, Context<TaskState> ctx) {
  List<Rectify> rectify = [
    Rectify(
        desc: '车间地面留有设备机油',
        depart: '缔科研发部',
        date: '2019-08-08',
        state: '待整改',
        rectifier: '高大陆')
  ];
  List<Recheck> recheck = [
    Recheck(
        desc: '办公室墙面掉皮',
        depart: '通昱消防',
        date: '2019-06-06',
        rechecker: '黄骁',
        state: '待复查')
  ];
  List<Keep> keep = [
    Keep(
        state: '待保养',
        remark: '新时代中国青年要勇于砥砺奋斗。奋斗是青春最亮丽的底色',
        keeper: '王婷',
        date: '2019-05-25')
  ];

  List<Inspect> inspect = [
    Inspect(name: '日常检查', pic: '贠拓', depart: '陕西缔科网络科技有限公司', state: '待检查')
  ];
  ToDosModel model = ToDosModel(
      rectify: rectify, recheck: recheck, keep: keep, inspect: inspect);

  ctx.dispatch(TaskActionCreator.onGetToDos(model));
}
