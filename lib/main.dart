import 'package:flutter/material.dart';
import 'package:my_work/config/constants.dart';
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
      title: 'My WOrk',
      theme: themeData(context),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }

  ThemeData themeData(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.blueGrey),
            hintStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            border: outlineInputBorder()),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: ThemeData().scaffoldBackgroundColor,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ));
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: kPrimaryColor),
      gapPadding: 10,
    );
  }
}
