import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_work/config/constants.dart';

import 'components/body.dart';

class WorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Body(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Text(
        'İş Defterim',
        style:
            TextStyle(color: kPrimaryColor, fontSize: 22, letterSpacing: 1.2),
      ),
      centerTitle: true,
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
