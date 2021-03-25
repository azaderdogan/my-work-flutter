import 'package:flutter/material.dart';
import 'package:my_work/config/constants.dart';
import 'package:my_work/screens/work_screen/components/preview_work.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: <Widget>[
            PreviewWork(),
            PreviewWork(),
            PreviewWork(),
            PreviewWork(),
          ],
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              'Yeni iş ekle',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
