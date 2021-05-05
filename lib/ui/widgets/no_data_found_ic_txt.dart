import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class NoDataFoundIcTxt extends StatelessWidget{
  final IconData icon;
  final Color color;

  NoDataFoundIcTxt(this.icon, {Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15 * SizeConfig.heightMultiplier),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/lottiefiles/sad-empty-box.json', fit: BoxFit.cover),

          Text("No data found\n\nPlease try again",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 22, fontFamily: 'Roboto', fontWeight: FontWeight.bold, wordSpacing: 5)),

        ],
      ),
    );
  }

}
