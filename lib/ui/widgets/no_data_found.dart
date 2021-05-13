import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class NoDataFound extends StatelessWidget{
  final String txt;
  const NoDataFound({Key key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 80),
            child: Lottie.asset('assets/animations/lottiefiles/empty_search_data.json', fit: BoxFit.cover, width: 200, height: 200),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Text(txt,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.normal, wordSpacing: 0)),
          ),

        ],
      ),
    );
  }

}