import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/notice_model.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    NoticeItemAction.action: _onAction,
    NoticeItemAction.onDelete: _onDeleteAction
  });
}

void _onAction(
  Action action,
  Context<Data> ctx,
) {}

Future _onDeleteAction(
  Action action,
  Context<Data> ctx,
) async {
  final String select = await showDialog<String>(
      context: ctx.context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(
            '确定删除此条消息?',
            style: TextStyle(fontSize: 16.0),
          ),
          actions: <Widget>[
            GestureDetector(
              child: const Text(
                '取消',
                style: TextStyle(fontSize: 15.0),
              ),
              onTap: () => Navigator.of(buildContext).pop(),
            ),
            GestureDetector(
              child: const Text('确定', style: TextStyle(fontSize: 15.0)),
              onTap: () => Navigator.of(buildContext).pop('确定'),
            )
          ],
        );
      });

  if (select == '确定') {
    DicoHttpRepository.doDeleteNoticeRequest(ctx.state.messageId).then((map) {
      if (map['code'] == 0) {
        DicoHttpRepository.doGetNotice().then((model) {
          ctx.dispatch(NoticeItemActionCreator.onDelete(model));
        });
      }
    });
  }
}
