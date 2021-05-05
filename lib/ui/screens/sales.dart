import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Sale extends StatelessWidget {
  static const String routeName = '/sale';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Sale"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is Sale page")));
  }
}