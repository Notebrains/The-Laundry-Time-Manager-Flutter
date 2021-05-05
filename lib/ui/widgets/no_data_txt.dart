import 'package:flutter/material.dart';

class NoDataTxt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        child: Text(
          'No data found!',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

}