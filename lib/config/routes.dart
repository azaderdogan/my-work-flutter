import 'package:flutter/material.dart';
import 'package:my_work/screens/home/home_screen.dart';
import 'package:my_work/screens/work_screen/work_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WorkScreen.routeName: (context) => WorkScreen(),
};
