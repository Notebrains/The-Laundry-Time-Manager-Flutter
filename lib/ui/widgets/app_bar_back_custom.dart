import 'package:flutter/material.dart';

Widget appBarIcBackCustom (BuildContext context, String text, Color txtColor, Color icColor, IconData ic, Color bgColor){
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text(
      text, style: TextStyle(color: txtColor, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    ),
    backgroundColor: bgColor,
    leading: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        ic,
        color: icColor,// add custom icons also
      ),
    ),
  );
}