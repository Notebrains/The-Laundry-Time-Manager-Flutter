import 'package:flutter/material.dart';

Widget appBarIcBack (BuildContext context ,String text){
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text(
      text, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    ),
    backgroundColor: Colors.white,
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black87,// add custom icons also
      ),
      onTap: (){
        Navigator.pop(context);
      },

    ),
  );
}