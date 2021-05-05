import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieBubbles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Lottie.asset('assets/animations/lottiefiles/bg-bubles-dens.json',
          fit: BoxFit.contain, height: double.infinity, width:  double.infinity
      ),
    );
  }
}