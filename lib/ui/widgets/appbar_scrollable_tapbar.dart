import 'package:flutter/material.dart';

Widget AppBarCommon (BuildContext context ,String text){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    toolbarHeight: 90,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: Colors.white,),
    title: Text(text, style: TextStyle(fontSize: 22 ,color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),

    /*actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              size: 26.0,
            ),
          )
      ),
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.more_vert,
            ),
          )
      ),
    ],*/
  );
}