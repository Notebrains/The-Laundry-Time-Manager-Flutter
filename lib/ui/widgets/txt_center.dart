import 'package:flutter/material.dart';

class TxtCenter extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;
  final double padding;
  final Function onTap;

  const TxtCenter({
    Key key,
    @required this.txt,
    @required this.txtColor,
    @required this.txtSize,
    @required this.fontWeight,
    @required this.padding,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        child: Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Roboto', fontWeight: fontWeight, fontSize: txtSize, color: txtColor),
        ),

        onTap: onTap,
      ),
    );
  }
}
