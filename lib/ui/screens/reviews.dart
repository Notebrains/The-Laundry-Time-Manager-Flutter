import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Review extends StatelessWidget {
  static const String routeName = '/review';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Review"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is Review page")));
  }
}