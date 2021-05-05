import 'package:flutter/material.dart';

class DividerTextCenter extends StatelessWidget {
  final String text;

  const DividerTextCenter({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      elevation: 6,
      // needed
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {

        }, // needed
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/animations/gifs/animated-bubbles.gif",
              width: 300,
              height: 50,
              fit: BoxFit.cover,
            ),

            Text(
              'SIGN UP',
              style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}