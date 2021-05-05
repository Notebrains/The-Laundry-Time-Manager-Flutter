import 'package:flutter/material.dart';

void showSnackBarWithActionBtn(BuildContext context, final String text, String btnText, {Function onTap}){
  final snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: btnText,
      onPressed: onTap
    ),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}



