import 'package:flutter/material.dart';

class DividerTextCenter extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;

  const DividerTextCenter({
    Key key,
    @required this.text,
    @required this.textColor,
    @required this.textSize,
    @required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontFamily: 'Roboto', fontWeight: fontWeight, fontSize: textSize, color: textColor),
            ),
          ),

          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),

        ],
      ),
    );
  }
}