import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class BtnFullWidthSqIc extends StatelessWidget {
  final String text;
  final double size;
  final IconData icon;
  final Color bgColors;
  final Color icColors;
  final Color txtColors;
  final Function onPressed;

  const BtnFullWidthSqIc({
    Key key,
    @required this.text,
    @required this.size,
    @required this.icon,
    @required this.bgColors,
    @required this.icColors,
    @required this.txtColors,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.2 * SizeConfig.heightMultiplier,
      width: double.infinity,
      child: ElevatedButton.icon(
        // ignore: unnecessary_statements
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: bgColors,
        ),
        icon: Icon(icon, color: icColors,),
        label: Text(text,
          style: TextStyle(
              fontSize: size,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              color: txtColors
          ),
        ),
      ),
    );
  }
}