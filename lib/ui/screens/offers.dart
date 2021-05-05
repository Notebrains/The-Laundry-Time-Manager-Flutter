import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Offers extends StatelessWidget {
  static const String routeName = '/offers';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("OFFERS"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is Offers")));
  }
}