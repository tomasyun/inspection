import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspection/app.dart';

void main() {
  runApp(createApp());
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.blue);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}
