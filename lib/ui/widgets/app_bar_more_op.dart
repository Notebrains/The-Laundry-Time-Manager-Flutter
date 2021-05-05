import 'package:flutter/material.dart';
import 'package:tlt_manager/helper/shared_preference_data.dart';
import 'package:tlt_manager/ui/exports/screens.dart';

Widget appBarWithMoreOption (BuildContext context, String txt, TabBar tabBar){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: tabBar.preferredSize,
      child: ColoredBox(
        color: Color(0x7925FF31),
        child: tabBar,
      ),
    ),
    title: Text(txt, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),),
    actions: <Widget>[
      PopupMenuButton<String>(
        icon: Icon(Icons.more_vert_outlined, color: Colors.black,),
        onSelected: (value){
          switch (value) {
            case 'Logout':
              SharedPreferenceHelper().clearPrefData();
              Navigator
                  .of(context)
                  .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => LogIn()));
              break;
            case 'Settings':
              SharedPreferenceHelper().getUserSavedData().then((model) => {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>
                    Settings(name: model.userName, email: model.userEmail, mobile: model.userMobile))),
              });
              break;
          }
        },

        itemBuilder: (BuildContext context) {
          return { 'Settings', 'Logout'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(choice == 'Settings'? Icons.settings_outlined : Icons.logout,
                    color: Colors.black54,),
                  onPressed: () {},
                ),
                title: Text(choice, style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black87),
              ),
            ),
            );
          }).toList();
        },
      ),
    ],
  );
}