import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/index/page.dart';

Widget createApp() {
  AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(pages: <String, Page<Object, dynamic>>{'index': IndexPage()})
  ]);

  return MaterialApp(
    title: 'inspection',
    theme: ThemeData(primaryColor: Colors.blue),
    debugShowCheckedModeBanner: true,
    home: routes.buildPage('index', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
