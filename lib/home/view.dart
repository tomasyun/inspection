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
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: Text(
        '首页',
        style: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
//            AppToast.showToast('这里是通知入口');
            dispatch(HomeActionCreator.onSkipNoticePage());
          },
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.notifications, color: Colors.red),
          ),
        )
      ],
    ),
    body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              child: BannerWidget(
                entity: state.banners,
                delayTime: 500,
                duration: 1000,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[800],
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -9.0)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              width: double.infinity,
              height: 40.0,
              margin: EdgeInsets.only(top: 30.0),
              child: MarqueeText(
                '陕西缔科网络科技有限公司',
                speed: 10.0,
                gap: 100.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      dispatch(HomeActionCreator.onScanQRCode());
                    },
                    child: _buildContainerItem(
                        asset: 'images/ic_avatar.png', title: '设备扫码'),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(HomeActionCreator.onHazardReport());
                    },
                    child: _buildContainerItem(
                        asset: 'images/ic_avatar.png', title: '隐患上报'),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatch(HomeActionCreator.onBreakDownReport());
                    },
                    child: _buildContainerItem(
                        asset: 'images/ic_avatar.png', title: '设备报修'),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
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
                        dispatch(HomeActionCreator.onClickMoreBtn());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          '更多',
                          style: TextStyle(fontSize: 14.0, color: Colors.red),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: _buildToDoWidgets(state, state.model),
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
            width: 80.0,
            height: 80.0,
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

Widget _buildItem({String title, String result}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(),
          flex: 1,
        ),
        Expanded(
          child: Text(
            result,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.left,
          ),
          flex: 6,
        )
      ],
    ),
  );
}

List<Widget> _buildToDoWidgets(HomeState state, HomeModel model) {
  List<Widget> list = [];
  if (model.todos.rectify != null) {
    model.todos.rectify.map((rectify) {
      list.add(_rectify(state, rectify));
    }).toList();
  }

  if (model.todos.recheck != null) {
    model.todos.recheck.map((recheck) {
      list.add(_recheck(state, recheck));
    }).toList();
  }

  if (model.todos.keep != null) {
    model.todos.keep.map((keep) {
      list.add(_keep(keep));
    }).toList();
  }

  if (model.todos.inspect != null) {
    model.todos.inspect.map((inspect) {
      list.add(_inspect(inspect));
    }).toList();
  }
  return list;
}

Widget _recheck(HomeState state, Recheck recheck) {
  return GestureDetector(
    onTap: () {
      Navigator.of(state.context).push(MaterialPageRoute(builder: (content) {
        Map<String, dynamic> map = {'state': recheck.state};
        return HazardInfoPage().buildPage(map);
      }));
    },
    child: Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                _buildItem(title: '隐患描述 :', result: '${recheck.desc}'),
                _buildItem(title: '责任部门 :', result: '${recheck.depart}'),
                _buildItem(title: '复查时间 :', result: '${recheck.date}'),
                _buildItem(title: '复查人 :', result: '${recheck.rechecker}'),
                _buildItem(title: '隐患状态 :', result: '${recheck.state}'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}

Widget _rectify(HomeState state, Rectify rectify) {
  return GestureDetector(
    onTap: () {
      Navigator.of(state.context).push(MaterialPageRoute(builder: (content) {
        Map<String, dynamic> map = {'state': rectify.state};
        return HazardInfoPage().buildPage(map);
      }));
    },
    child: Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                _buildItem(title: '隐患描述 :', result: '${rectify.desc}'),
                _buildItem(title: '责任部门 :', result: '${rectify.depart}'),
                _buildItem(title: '发现时间 :', result: '${rectify.date}'),
                _buildItem(title: '隐患状态 :', result: '${rectify.state}'),
                _buildItem(title: '整改人 :', result: '${rectify.rectifier}'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}

Widget _keep(Keep keep) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                _buildItem(title: '保养时间 :', result: '${keep.date}'),
                _buildItem(title: '保养人 :', result: '${keep.keeper}'),
                _buildItem(title: '保养状态 :', result: '${keep.state}'),
                _buildItem(title: '备注 :', result: '${keep.remark}'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}

Widget _inspect(Inspect inspect) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    _buildItem(title: '设备名称 :', result: '${inspect.name}'),
                    _buildItem(title: '责任人 :', result: '${inspect.pic}'),
                    _buildItem(title: '责任部门 :', result: '${inspect.depart}'),
                    _buildItem(title: '状态 :', result: '${inspect.state}'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: AlignmentDirectional.center,
                  color: Colors.blue,
                  width: double.infinity,
                  height: 50.0,
                  child: Text(
                    '去扫码',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.grey[100],
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
