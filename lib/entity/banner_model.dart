import 'package:inspection/banner/banner_item.dart';

class BannerModel extends BannerItem {
  String link;
  String desc;

  BannerModel({this.link, this.desc});

  @override
  get title => desc;

  @override
  get url => link;
}
