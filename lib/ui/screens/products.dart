import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Product extends StatelessWidget {
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Product"),
        ),
        drawer: NavigationDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ));
  }
}