import 'package:flutter/material.dart';
import 'package:my_work/config/constants.dart';
import 'package:my_work/screens/home/components/preview_work.dart';
import 'package:my_work/screens/work_screen/work_screen.dart';

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
          ],
        ),
        CustomButton(
          text: 'Yeni İş Ekle',
          onTap: () {
            Navigator.pushNamed(context, WorkScreen.routeName);
          },
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
