import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class EmptyData extends StatelessWidget {
  final String text;
  final String imgUrl;

  const EmptyData({
    Key key,
    @required this.text,
    @required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.all(Radius.circular(8)),
        //border: Border.all(color: Colors.grey[50]),
      ),

      margin: EdgeInsets.all(1.3 * SizeConfig.heightMultiplier),
      padding: EdgeInsets.all(1.0 * SizeConfig.heightMultiplier),
      height: 25 * SizeConfig.heightMultiplier,
      width: 25 * SizeConfig.heightMultiplier,
      child: cachedNetImage(imgUrl),
    );
  }
}
