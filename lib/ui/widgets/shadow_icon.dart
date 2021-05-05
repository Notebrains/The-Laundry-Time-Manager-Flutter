import 'dart:ui';

import 'package:flutter/material.dart';

/*
Usage
Your can simply replace the native Icon by the ShadowIcon widget call:

IconButton(
  icon: ShadowIcon(FontAwesomeIcons.chevronLeft, color: kLight),
  onPressed: () => Get.back(),
),
* */

class ShadowIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  ShadowIcon(this.icon, {Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.5,
          top: 0.5,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1.0,
              sigmaY: 1.0,
            ),
            //child: FaIcon(this.icon, color: color.withOpacity(0.7)),
          ),
        ),
        //FaIcon(this.icon, color: color),
      ],
    );
  }
}