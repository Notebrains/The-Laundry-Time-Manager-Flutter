import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Customer extends StatelessWidget {
  static const String routeName = '/customer';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Customer"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is customer page")));
  }
}