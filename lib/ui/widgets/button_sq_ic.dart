import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class ButtonSqIc extends StatelessWidget {
  final String text;
  final double size;
  final IconData icon;
  final Color bgColors;
  final Color icColors;
  final Color txtColors;
  final Function onPressed;

  const ButtonSqIc({
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
      height: 7 * SizeConfig.heightMultiplier,
      child: ElevatedButton.icon(
        // ignore: unnecessary_statements
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
        primary: bgColors,
        onPrimary: bgColors,
        onSurface: bgColors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
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