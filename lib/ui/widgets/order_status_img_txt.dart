import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class OrderStatusImgTxt extends StatelessWidget {
  final String assetImg;
  final String txt;
  final Color txtColor;

  OrderStatusImgTxt({Key key, this.assetImg, this.txt, this.txtColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 70 * SizeConfig.imageSizeMultiplier,
            height: 70 * SizeConfig.imageSizeMultiplier,
            child: Image.asset(assetImg),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            txt,
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 24, color: txtColor),
          ),
        ),
      ],
    );
  }
}