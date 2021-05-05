import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class PickUp extends StatelessWidget {
  static const String routeName = '/pickup';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("pickup"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is pickup page")));
  }
}