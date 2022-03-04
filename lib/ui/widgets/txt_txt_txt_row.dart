import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class TxtTxtTxtRow extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color text1Color;
  final Color text2Color;
  final Color bgColor;

  const TxtTxtTxtRow({
    Key key,
    @required this.text1,
    @required this.text2,
    @required this.text3,
    @required this.text1Color,
    @required this.text2Color,
    @required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SlideInLeft(
      child: Container(
        color: bgColor,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 16.0, right: 16, top: 2),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                text1,
                textAlign: TextAlign.start,
                style:
                TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: text1Color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),

            Expanded(
              flex: 1,
              child: Text(
                text2,
                textAlign: TextAlign.start,
                style:
                TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: text1Color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),

            Expanded(
              flex: 1,
              child: Text(
                text3,
                textAlign: TextAlign.start,
                style:
                TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: text2Color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}