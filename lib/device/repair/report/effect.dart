import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:inspection/filter/page.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<ReportState> buildEffect() {
  return combineEffects(<Object, Effect<ReportState>>{
    ReportAction.action: _onAction,
    ReportAction.depart: _onDepartSkipFilter,
    ReportAction.pic: _onPicSkipFilter,
    ReportAction.repairman: _onRepairManSkipFilter,
    ReportAction.report: _onReport,
    ReportAction.goBack: _onGoBack,
    ReportAction.repairDate: _onShowRepairDate,
  });
}

void _onAction(Action action, Context<ReportState> ctx) {}
void _onShowRepairDate(Action action, Context<ReportState> ctx) {
  new Picker(
    adapter: new DateTimePickerAdapter(
        type: PickerDateTimeType.kYMD,
        isNumberMonth: true,
        yearSuffix: '年',
        monthSuffix: '月',
        daySuffix: '日'),
    onConfirm: (Picker picker, List value) {
      ctx.dispatch(ReportActionCreator.onGetRepairDateRst(
          picker.adapter.text.substring(0, 10)));
    },
    cancelText: '取消',
    confirmText: '确定',
    hideHeader: true,
  ).showDialog(ctx.context);
}

Future<bool> _onGoBack(Action action, Context<ReportState> ctx) {
  return Future<bool>.value(true);
}

void _onReport(Action action, Context<ReportState> ctx) {
  if (ctx.state.deviceNameController.text.isEmpty) {
    AppCommons.showToast('设备名称不能为空');
  } else if (ctx.state.deviceNoController.text.isEmpty) {
    AppCommons.showToast('设备编号不能为空');
  } else if (ctx.state.departRst['name'] == '请选择') {
    AppCommons.showToast('请选择责任部门');
  } else if (ctx.state.picRst['name'] == '请选择') {
    if (ctx.state.departRst['name'] == '请选择') {
      AppCommons.showToast('请先选择责任部门');
    } else {
      AppCommons.showToast('请选择责任人');
    }
  } else if (ctx.state.repairManRst['name'] == '请选择') {
    AppCommons.showToast('请选择维修人');
  } else if (ctx.state.repairDateRst == '请选择') {
    AppCommons.showToast('请选择维修时间');
  } else if (ctx.state.descController.text.isEmpty) {
    AppCommons.showToast('请填写故障描述');
  } else {
    String deviceName = ctx.state.deviceNameController.text;
    String deviceNo = ctx.state.deviceNoController.text;
    String departName = ctx.state.departRst['name'];
    String departId = ctx.state.departRst['id'];
    String picName = ctx.state.picRst['name'];
    String picId = ctx.state.picRst['id'];
    String repairManName = ctx.state.repairManRst['name'];
    String repairManId = ctx.state.repairManRst['id'];
    String repairDate = ctx.state.repairDateRst;
    String decs = ctx.state.descController.text;
    Map<String, String> map = Map();
    map['equipmentId'] = deviceNo;
    map['equipmentName'] = deviceName;
    map['organizationId'] = departId;
    map['organizationName'] = departName;
    map['personLiableId'] = picId;
    map['personLiableName'] = picName;
    map['remark'] = decs;
    map['repairDate'] = repairDate;
    map['repairPersonId'] = repairManId;
    map['repairPersonName'] = repairManName;
    DicoHttpRepository.repairReportRequest(map).then((map) {
      if (map['code'] == 0) {
        AppCommons.showToast('保存成功');
      } else {
        AppCommons.showToast('保存失败');
      }
    });
  }
}

void _onDepartSkipFilter(Action action, Context<ReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = {'flag': 'depart'};
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(ReportActionCreator.onGetDepartRst(value));
    }
  });
}

void _onPicSkipFilter(Action action, Context<ReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = Map();
    map['flag'] = 'pic';
    map['departId'] = ctx.state.departRst['id'] ?? '';
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(ReportActionCreator.onGetPicRst(value));
    }
  });
}

void _onRepairManSkipFilter(Action action, Context<ReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = {'flag': 'repairman'};
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(ReportActionCreator.onGetRepairManRst(value));
    }
  });
}
