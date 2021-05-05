import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

Widget drawerHeader() {
  return DrawerHeader(
    margin: EdgeInsets.only(bottom: 12),
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/bg-1.png'))),
    child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text("THE\nLAUNDRY TIME", style: TextStyle(color: AppTheme.topBarBackgroundColor, fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
          )
    ]),
  );
}
