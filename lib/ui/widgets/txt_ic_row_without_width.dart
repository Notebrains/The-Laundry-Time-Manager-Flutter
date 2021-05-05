import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class TxtIcRowWidth extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;
  final IconData icon;
  final Color icColor;

  const TxtIcRowWidth({
    Key key,
    @required this.txt,
    @required this.txtColor,
    @required this.txtSize,
    @required this.fontWeight,
    @required this.icon,
    @required this.icColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: icColor,
        ),

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            txt,
            style: TextStyle(fontFamily: 'Roboto', fontWeight: fontWeight, fontSize: txtSize, color: txtColor),
            maxLines: 4,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
