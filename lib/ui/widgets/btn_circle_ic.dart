import 'package:flutter/material.dart';

class BtnCircleIc extends StatelessWidget {
  final String text;
  final IconData ic;
  final Function onTap;

  const BtnCircleIc({
    Key key,
    @required this.text,
    @required this.ic,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipOval(
        child: Material(
          elevation: 8,
          color: Colors.grey[100], // button color
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(width: 45, height: 45, child: Icon(ic)),
          ),
        ),
      ),
      onTap: ()=> onTap,
    );
  }
}