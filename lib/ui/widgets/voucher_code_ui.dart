import 'package:flutter/material.dart';

class VoucherCodeUi extends StatelessWidget {

  final String initialTxtValue;
  final String hint;
  final TextInputType textInputType;
  final String Function(String) validator;
  final Function(String) onSaved;
  final Function onTap;

  const VoucherCodeUi({
    Key key,
    @required this.initialTxtValue,
    @required this.hint,
    @required this.textInputType,
    this.validator,
    @required this.onSaved,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 5.0,
        ),
      ]),
      margin: EdgeInsets.fromLTRB(5.0, 8, 5.0, 12),
      padding: EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              initialValue: initialTxtValue,
              enabled: true,
              autocorrect: true,
              keyboardType: textInputType,
              validator: validator,
              onChanged: onSaved,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
          ),

          InkWell(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              width: 65,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text('APPLY',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold
                ),), // Change this icon as per your requirement
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
