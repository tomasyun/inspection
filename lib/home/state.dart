import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/banner_model.dart';

class HomeState implements Cloneable<HomeState> {
  List<BannerModel> banners = List<BannerModel>();

  @override
  HomeState clone() {
    return HomeState()..banners = banners;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
