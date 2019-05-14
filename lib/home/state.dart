import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/banner_model.dart';
import 'package:inspection/entity/home_model.dart';

class HomeState implements Cloneable<HomeState> {
  BuildContext context;
  List<BannerModel> banners = List<BannerModel>();
  HomeModel model;

  @override
  HomeState clone() {
    return HomeState()
      ..banners = banners
      ..model = model
      ..context = context;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState state = HomeState();
  return state;
}
