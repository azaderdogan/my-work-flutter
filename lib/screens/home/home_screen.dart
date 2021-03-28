import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_work/config/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Body(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'İş Defterim',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: kPrimaryColor),
      ),
      elevation: 0,
      backgroundColor: ThemeData().scaffoldBackgroundColor,
    );
  }

  FloatingActionButton buildActionButton() {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        size: 40,
      ),
      onPressed: () {},
      backgroundColor: kPrimaryColor,
    );
  }
}
