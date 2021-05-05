import 'package:flutter/material.dart';

class SomethingWrongScreen extends StatelessWidget {
  final Function onTap;

  SomethingWrongScreen({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/img_error.png",
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),),
                ),
                onPressed: onTap,
                child: Text("  Retry   ".toUpperCase()),
              ),
            ),
          )
        ],
      ),
    );
  }
}