import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class ButtonFullWidthBlueBg extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color bgColors;
  final Color icColors;
  final Color txtColors;
  final Function onPressed;

  const ButtonFullWidthBlueBg({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.bgColors,
    @required this.icColors,
    @required this.txtColors,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8 * SizeConfig.heightMultiplier,
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
              fontWeight: FontWeight.bold,
              color: txtColors
          ),
        ),
      ),
    );
  }
}