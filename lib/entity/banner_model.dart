import 'package:inspection/banner/banner_item.dart';

class BannerModel extends BannerItem {
  String link;
  String desc;

  BannerModel({this.link, this.desc});

  @override
  // TODO: implement title
  get title => desc;

  @override
  // TODO: implement url
  get url => link;
}
