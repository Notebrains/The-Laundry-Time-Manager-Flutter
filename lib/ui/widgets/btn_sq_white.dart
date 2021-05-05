import 'package:flutter/material.dart';

class BtnSqWhite extends StatelessWidget {
  final String txt;
  final String hint;
  final bool isPassInvisible;
  final IconData icon;
  final TextInputType textInputType;
  final String Function(String) validator;
  final Function(String) onSaved;


  const BtnSqWhite({
    Key key,
    @required this.txt,
    @required this.hint,
    @required this.isPassInvisible,
    @required this.icon,
    @required this.textInputType,
    @required this.validator,
    @required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.4)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 5.0,
              ),
        ]),
        margin: EdgeInsets.fromLTRB(24.0, 5, 24.0, 8),
        child: TextFormField(
          initialValue: txt,
          enabled: true,
          autocorrect: true,
          obscureText: isPassInvisible,
          keyboardType: textInputType,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(2.0, 2.0, 3.0, 2.0),
              height: 45,
              child: Icon(icon), // Change this icon as per your requirement
            ),
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
            ),
          ),
        ));
  }
}
