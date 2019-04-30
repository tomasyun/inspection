import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    ReviewState state, Dispatch dispatch, ViewService viewService) {
  return ReviewPageWidget();
}

class ReviewPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewPageState();
}

class ReviewPageState extends State<ReviewPageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '隐患查看',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(),
    );
  }
}
