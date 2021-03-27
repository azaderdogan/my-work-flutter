import 'package:flutter/material.dart';
import 'package:my_work/config/constants.dart';

class PreviewWork extends StatelessWidget {
  const PreviewWork({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: kSubtitleColor, width: 1.0),
          boxShadow: [
            // BoxShadow(offset: Offset(dx, dy))
          ]),
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Azad',
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '500 TL',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              'Kooperatif mah. eski hastane yakını lorem ipsum lorem ipsum lorem  ipsumlorem ipsum lorem ipsum lorem  ipsum',
              style: TextStyle(
                color: kSubtitleColor,
                fontSize: 21,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
