import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/banner/banner.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/global/marquee.dart';
import 'package:inspection/hazard/info/page.dart';
import 'package:inspection/home/action.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text(
        '首页',
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
//            AppToast.showToast('这里是通知入口');
            dispatch(HomeActionCreator.onSkipNoticePage());
          },
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Image.asset(
              'images/ic_notice.png',
              width: 20.0,
              color: Colors.white,
              height: 20.0,
            ),
          ),
        )
      ],
    ),
    body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: BannerWidget(
                entity: state.banners,
                delayTime: 500,
                duration: 1000,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.only(
                  left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[800],
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Image.asset('images/ic_announce.png'),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: MarqueeText(
                        '陕西缔科网络科技有限公司',
                        speed: 10.0,
                        gap: 100.0,
                      ),
                    ),
                    flex: 8,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        dispatch(HomeActionCreator.onSkipNoticePage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 1.0,
                              height: 10.0,
                              color: Colors.black45,
                              margin: EdgeInsets.only(top: 3.0),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(
                                '更多',
                                style: TextStyle(color: Colors.black45),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      dispatch(HomeActionCreator.onScanQRCode());
                    },
                    child: _buildContainerItem(
                        asset: 'images/ic_scan.png', title: '设备扫码'),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(HomeActionCreator.onHazardReport());
                    },
                    child: _buildContainerItem(
                        asset: 'images/ic_hazard_report.png', title: '隐患上报'),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(HomeActionCreator.onBreakDownReport());
                    },
                    child: _buildContainerItem(
                        asset: 'images/ic_repair_report.png', title: '设备维修'),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              color: Colors.grey[100],
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 3.0,
                    color: Colors.blue,
                    height: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      '代办任务',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        dispatch(HomeActionCreator.onSkipMoreTask());
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                '更多',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 14.0),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: _buildToDoWidgets(state: state, dispatch: dispatch),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _buildContainerItem({String asset, String title}) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            asset,
            width: 50.0,
            height: 50.0,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
        )
      ],
    ),
  );
}

List<Widget> _buildToDoWidgets({HomeState state, Dispatch dispatch}) {
  List<Widget> list = [];
  //待整改
  List<Repair> repair = state.model.data.todos.repair;
  if (repair != null && repair.isNotEmpty) {
    repair.map((item) {
      list.add(_rectify(state, item));
    }).toList();
  }
//待复查
  List<Review> review = state.model.data.todos.review;
  if (review != null && review.isNotEmpty) {
    review.map((item) {
      list.add(_recheck(state, item));
    }).toList();
  }
//待巡检
  List<Recheck> recheck = state.model.data.todos.recheck;
  if (recheck != null && recheck.isNotEmpty) {
    recheck.map((item) {
      list.add(_inspect(item, dispatch));
    }).toList();
  }
  return list;
}

Widget _recheck(HomeState state, Review review) {
  return Container(
    margin: EdgeInsets.all(15.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey[800],
            blurRadius: 10.0,
            offset: Offset(0.0, 2.0),
            spreadRadius: -7.0)
      ],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          _buildItemHeader(title: '${review.equipmentName}', result: '待复查'),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            color: Colors.black12,
            height: 0.5,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Column(
                      children: <Widget>[
                        _buildItem(
                            title: '位置', result: '${review.dangerAddress}'),
                        _buildItem(
                            title: '隐患描述', result: '${review.dangerRemark}'),
                        _buildItem(
                            title: '隐患类型', result: '${review.dangerType}'),
                        _buildItem(
                            title: '编号', result: '${review.equipmentCode}'),
                      ],
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          '重大隐患',
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 45.0),
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            Navigator.of(state.context)
                                .push(MaterialPageRoute(builder: (content) {
                              Map<String, dynamic> map = {'state': '待复查'};
                              return HazardInfoPage().buildPage(map);
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text(
                            '去复查',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                        ),
                      ),
                    ],
                  ),
                  flex: 2,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _rectify(HomeState state, Repair rectify) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.all(15.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey[800],
            blurRadius: 10.0,
            offset: Offset(0.0, 2.0),
            spreadRadius: -7.0)
      ],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Column(
      children: <Widget>[
        _buildItemHeader(title: '${rectify.equipmentName}', result: '待整改'),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          color: Colors.black12,
          height: 0.5,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      _buildItem(
                          title: '位置', result: '${rectify.dangerAddress}'),
                      _buildItem(
                          title: '隐患描述', result: '${rectify.dangerRemark}'),
                      _buildItem(
                          title: '隐患类型', result: '${rectify.dangerType}'),
                      _buildItem(
                          title: '编号', result: '${rectify.equipmentCode}'),
                    ],
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '重大隐患',
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 45.0),
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          Navigator.of(state.context)
                              .push(MaterialPageRoute(builder: (content) {
                            Map<String, dynamic> map = {'state': '待整改'};
                            return HazardInfoPage().buildPage(map);
                          }));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Text(
                          '待整改',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                      ),
                    ),
                  ],
                ),
                flex: 2,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _inspect(Recheck inspect, Dispatch dispatch) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(15.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  blurRadius: 10.0,
                  offset: Offset(0.0, 2.0),
                  spreadRadius: -7.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            children: <Widget>[
              _buildItemHeader(
                  title: '${inspect.equipmentName}', result: '待检查'),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                color: Colors.black12,
                height: 0.5,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: Column(
                          children: <Widget>[
                            _buildItem(
                                title: '位置', result: '${inspect.installArea}'),
                            _buildItem(
                                title: '编号',
                                result: '${inspect.equipmentCode}'),
                            _buildItem(
                                title: '设备类型',
                                result: '${inspect.equipmentType}'),
                          ],
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          color: Colors.green,
                          onPressed: () {
                            dispatch(HomeActionCreator.onScanQRCode());
                          },
                          child: Text(
                            '扫一扫',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                        ),
                      ),
                      flex: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildItem({String title, String result}) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            child: Text(
              result,
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
          ),
          flex: 7,
        ),
      ],
    ),
  );
}

Widget _buildItemHeader({String title, String result}) {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0),
              maxLines: 1,
            ),
          ),
          flex: 4,
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              result,
              style: TextStyle(color: Colors.black45, fontSize: 14.0),
            ),
          ),
          flex: 6,
        )
      ],
    ),
  );
}
