import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

Widget AppBarCommon (BuildContext context ,String text){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: AppTheme.selectedTabBackgroundColor),
    title: Text(text, style: TextStyle(fontSize: 22 ,color: Colors.blueGrey, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
  );
}