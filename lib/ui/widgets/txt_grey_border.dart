import 'package:flutter/material.dart';

class TxtBorderCircleGey extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final Color bgColor;
  final Color borderColor;
  final Function onPressed;

  const TxtBorderCircleGey({
    Key key,
    @required this.txt,
    @required this.txtColor,
    @required this.bgColor,
    @required this.borderColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(18.0), //                 <--- border radius here
          ),
        ),
        child: Text(
          txt,
          style: TextStyle(fontSize: 14.0, color: txtColor),
        ),
      ),
      onTap: onPressed,
    );
  }
}
