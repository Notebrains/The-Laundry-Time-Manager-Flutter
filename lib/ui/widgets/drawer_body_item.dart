import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/styles/txt_styles.dart';

Widget drawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 16),
    title: Column(
      children: [
        Row(
          children: <Widget>[
            Icon(icon, color: AppTheme.topBarBackgroundColor,),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(text, style: txtStyleNavDrawer(),),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.only(top: 5.0, right: 24),
          child: Divider(color: AppTheme.topBarBackgroundColor.withOpacity(0.2),),
        ),
      ],
    ),
    onTap: onTap,
  );
}