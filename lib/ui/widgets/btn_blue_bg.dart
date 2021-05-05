import 'package:flutter/material.dart';

class BtnBgBlue extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color bgColors;

  const BtnBgBlue({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.bgColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(right: 24, left: 24),
      margin: EdgeInsets.only(top: 60, bottom: 12),
      width: double.infinity,
      child: MaterialButton(
        elevation: 2,
        color: bgColors,
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}