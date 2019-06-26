import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/info/action.dart';
import 'package:inspection/widget/state_view.dart' as stateView;

import 'state.dart';

Widget buildView(
  InfoState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
      appBar: AppBar(
        title: Text(
          '设备信息',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: state.model != null && state.model.data != null
          ? Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                buildBottomNavigator(dispatch),
                Container(
                  height: double.infinity,
                  padding: EdgeInsets.only(bottom: 60),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0, bottom: 60),
                      child: Column(
                        children: <Widget>[
                          state.model.data.equipmentName != null
                              ? _buildDeviceInfoItem(
                                  title: '设备名称',
                                  content: state.model.data.equipmentName)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentName != null
                              ? _buildDeviceInfoItem(
                                  title: '设备编号',
                                  content: state.model.data.equipmentCode)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.companyName != null
                              ? _buildDeviceInfoItem(
                                  title: '所属单位',
                                  content: state.model.data.companyName)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.organizationName != null
                              ? _buildDeviceInfoItem(
                                  title: '所属部门',
                                  content: state.model.data.organizationName)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentPersonLiableName != null
                              ? _buildDeviceInfoItem(
                                  title: '设备负责人',
                                  content: state
                                      .model.data.equipmentPersonLiableName)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentType != null
                              ? _buildDeviceInfoItem(
                                  title: '设备分类',
                                  content: state.model.data.equipmentType)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentModel != null
                              ? _buildDeviceInfoItem(
                                  title: '设备型号',
                                  content: state.model.data.equipmentModel)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.installArea != null
                              ? _buildDeviceInfoItem(
                                  title: '安装区域',
                                  content: state.model.data.installArea)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentManufacturer != null
                              ? _buildDeviceInfoItem(
                                  title: '厂家',
                                  content:
                                      state.model.data.equipmentManufacturer)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.equipmentManufactureTime != null
                              ? _buildDeviceInfoItem(
                                  title: '生产日期',
                                  content:
                                      state.model.data.equipmentManufactureTime)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.nextRepairTime != null
                              ? _buildDeviceInfoItem(
                                  title: '下次维修时间',
                                  content: state.model.data.nextRepairTime)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.scrapTime != null
                              ? _buildDeviceInfoItem(
                                  title: '报废日期',
                                  content: state.model.data.scrapTime)
                              : Container(
                                  height: 0.0,
                                ),
                          state.model.data.remark != null
                              ? _buildDeviceInfoItem(
                                  title: '备注', content: state.model.data.remark)
                              : Container(
                                  height: 0.0,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              child: stateView.blackPage(),
            ));
}

Widget _buildDeviceInfoItem({String title, String content}) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black45,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          flex: 7,
        )
      ],
    ),
  );
}

Widget buildBottomNavigator(Dispatch dispatch) {
  return Container(
    height: 60.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              dispatch(InfoActionCreator.onSkipRepairRecord());
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.blue,
              height: double.infinity,
              child: Text(
                '维修记录',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              dispatch(InfoActionCreator.onSkipKeepRecord());
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              color: Colors.grey,
              height: double.infinity,
              child: Text(
                '保养记录',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
