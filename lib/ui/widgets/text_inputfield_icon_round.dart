import 'package:flutter/material.dart';

class IfIconRound extends StatelessWidget {
  final String hint;
  final IconData icon;

  const IfIconRound({
    Key key,
    @required this.hint,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8.0,
          ),
        ]),
        margin: EdgeInsets.fromLTRB(40.0, 12, 40.0, 12),
        child: TextField(
          enabled: true,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(2.0, 2.0, 3.0, 2.0),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              ),
              child: Icon(icon), // Change this icon as per your requirement
            ),
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
            ),
          ),
        ));
  }
}
