import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class TltProgressbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/animations/lottiefiles/laundry-illustration-animation.json'),

        Txt(txt: 'Loading...', txtColor: Colors.black54, txtSize: 20, fontWeight: FontWeight.normal, padding: 0, onTap: null)
      ],
    );
  }

}