import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/rectify/report/action.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'state.dart';

Widget buildView(
    RectifyReportState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '整改上报',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(bottom: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '整改意见',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  state.map != null && state.map.isNotEmpty
                      ? state.map['opinion']
                      : '',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '整改情况(200字以内)',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                color: Colors.white,
                child: TextField(
                  controller: state.controller,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  maxLines: 6,
                  cursorWidth: 1.0,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                      hintText: "请输入复查情况",
                      contentPadding: EdgeInsets.all(15.0),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '整改附件(最多可上传3张)',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    dispatch(RectifyReportActionCreator.onAddAttachmentClick());
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.grey,
                    child: FadeInImage.assetNetwork(
                        placeholder: 'images/ic_add.png',
                        image: '',
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: _buildGridView(state: state),
                constraints: BoxConstraints.tightFor(
                    width: double.infinity,
                    height: state.assets.length > 0 ? 110.0 : 0.0),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(top: 50.0),
                child: _buildRaisedButton(dispatch: dispatch),
              )
            ],
          )),
    ),
  );
}

Widget _buildGridView({RectifyReportState state}) {
  return GridView.count(
    crossAxisCount: 3,
    crossAxisSpacing: 5.0,
    children: List.generate(state.assets.length, (index) {
      Asset asset = state.assets[index];
      return AssetThumb(
        asset: asset,
        width: 100,
        height: 100,
      );
    }),
  );
}

Widget _buildRaisedButton({Dispatch dispatch}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 15.0),
    child: RaisedButton(
        onPressed: () {
          dispatch(RectifyReportActionCreator.onReport());
        },
        child: Text(
          '提交',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        color: Colors.blue,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
  );
}
