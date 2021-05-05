import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class TxtIcRow extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;

  const TxtIcRow({
    Key key,
    @required this.txt,
    @required this.txtColor,
    @required this.txtSize,
    @required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 40 * SizeConfig.widthMultiplier,
        padding: const EdgeInsets.only(left: 3, top: 2, bottom: 2),
        child: Text(
          txt,
          style: TextStyle(fontFamily: 'Roboto', fontWeight: fontWeight, fontSize: txtSize, color: txtColor),
          maxLines: 4,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
