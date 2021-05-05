import 'package:flutter/material.dart';
import 'package:tlt_manager/helper/libraries/avatar_glow.dart';

class IcTxtBtnColumn extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final Color icColor;
  final double txtSize;
  final String btnTxt;
  final IconData icon;
  final Function onTap;

  const IcTxtBtnColumn({
    Key key,
    @required this.txt,
    @required this.txtColor,
    @required this.txtSize,
    @required this.btnTxt,
    @required this.icon,
    @required this.icColor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvatarGlow(
          glowColor: icColor,
            child: Icon(
              icon,
              color: icColor,
              size: 50,
            ),
            endRadius: 60),

        Padding(
          padding: const EdgeInsets.fromLTRB(8, 24, 8, 45),
          child: Center(
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: txtSize, color: txtColor),
            ),
          ),
        ),

        ElevatedButton(
          onPressed: onTap,
          child: Text(
            btnTxt,
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
