import 'package:flutter/material.dart';

class BtnBorderWhite extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BtnBorderWhite({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(right: 20, left: 20),
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      child: OutlineButton(
          highlightedBorderColor: Colors.blue,
          splashColor: Colors.lightBlueAccent,
          borderSide: BorderSide(color: Colors.blue),
          child: Text(text, style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5.0))
      ),
    );
  }
}