import 'package:flutter/material.dart';

class NavItem {
  final Widget icon;
  final Widget title;
  final TickerProvider vsync;

  NavItem({this.icon, this.title, this.vsync})
      : item = new BottomNavigationBarItem(icon: icon, title: title),
        controller = new AnimationController(vsync: vsync);

  final BottomNavigationBarItem item;
  final AnimationController controller;
}
