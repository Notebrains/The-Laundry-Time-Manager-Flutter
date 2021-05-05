import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class IcIfIc extends StatelessWidget {
  final String text;
  final String hint;
  final IconData icon1;
  final IconData icon2;
  final Color icColor1;
  final Color icColor2;
  final Function onPressedOnIc2;
  final TextInputType textInputType;
  final String Function(String) validator;
  final Function(String) onSaved;
  final Function(String) onChange;
  final double marginLeftRight;
  final bool enabled;

  const IcIfIc({
    Key key,
    @required this.text,
    @required this.hint,
    @required this.icon1,
    @required this.icon2,
    @required this.icColor1,
    @required this.icColor2,
    @required this.onPressedOnIc2,
    @required this.textInputType,
    @required this.validator,
    @required this.onSaved,
    @required this.onChange,
    @required this.marginLeftRight,
    @required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 5.0,
          ),
        ]),
        margin: EdgeInsets.fromLTRB(marginLeftRight, 5, marginLeftRight, 8),
        child: TextFormField(
          initialValue: text,
          readOnly: !enabled,
          autocorrect: true,
          keyboardType: textInputType,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(2.0, 2.0, 3.0, 2.0),
              height: 55,
              child: Icon(icon1, color: icColor1,), // Change this icon as per your requirement
            ),
            suffixIcon: Container(
              margin: EdgeInsets.fromLTRB(2.0, 2.0, 3.0, 2.0),
              height: 55,
              child: InkWell(
                child: Icon(icon2, color: icColor2,),
                onTap: onPressedOnIc2,),
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
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
            ),
          ),
        ));
  }
}