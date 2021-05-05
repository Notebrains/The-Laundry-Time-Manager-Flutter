import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class DropOff extends StatelessWidget {
  static const String routeName = '/dropoff';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Drop Off"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is Drop Off page")));
  }
}