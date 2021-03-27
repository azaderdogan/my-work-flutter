import 'package:flutter/material.dart';
import 'package:my_work/config/routes.dart';
import 'package:my_work/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gfhgfh',
      theme: ThemeData(
          primarySwatch: Colors.blue
          ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
