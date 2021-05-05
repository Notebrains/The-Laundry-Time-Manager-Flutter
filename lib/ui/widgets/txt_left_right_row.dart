import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class TxtLeftRightRow extends StatelessWidget {
  final String text1;
  final String text2;
  final Color text1Color;
  final Color text2Color;

  const TxtLeftRightRow({
    Key key,
    @required this.text1,
    @required this.text2,
    @required this.text1Color,
    @required this.text2Color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 1.8 * SizeConfig.heightMultiplier, right: 1.5 * SizeConfig.heightMultiplier),
        padding: EdgeInsets.all(0.7 * SizeConfig.heightMultiplier),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              textAlign: TextAlign.start,
              style:
              TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 13, color: text1Color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),

            Text(
              text2,
              textAlign: TextAlign.start,
              style:
              TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 13, color: text2Color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}