import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class BtnIcTxtIcBgWhite extends StatelessWidget {
  final String text;
  final double textSize;
  final IconData icon1;
  final IconData icon2;
  final Function onPressed;

  const BtnIcTxtIcBgWhite({
    Key key,
    @required this.text,
    @required this.textSize,
    @required this.icon1,
    @required this.icon2,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.fromLTRB(5, 8, 5, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon1,  size: 25, color: Colors.grey,),

            Container(
              width: 65 * SizeConfig.widthMultiplier,
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: textSize, color: Colors.grey),
              ),
            ),

            Align(
                alignment: Alignment.topRight,
                child: Icon(icon2, color: Colors.grey, )),
          ],
        ),
      ),

      onTap: onPressed
    );
  }
}