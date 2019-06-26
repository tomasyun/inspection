import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/notice_model.dart';
import 'package:inspection/notice/item/action.dart';

Widget buildView(
  Data data,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    child: ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {},
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    '${data.messageTitle}',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '${data.messageContent}',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            dispatch(NoticeItemActionCreator.onDeleteAction());
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '删除',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Text(
                          '${data.messageDate}',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.right,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            isExpanded: true,
          ),
        ]),
  );
}
