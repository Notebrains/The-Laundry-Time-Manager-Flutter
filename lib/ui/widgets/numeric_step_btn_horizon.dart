import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class NumericStepButtonHorizontal extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  NumericStepButtonHorizontal(
      {Key key, this.minValue = 1, this.maxValue = 100, this.onChanged})
      : super(key: key);

  @override
  State<NumericStepButtonHorizontal> createState() {
    return _NumericStepButtonHorizontalState();
  }
}

class _NumericStepButtonHorizontalState extends State<NumericStepButtonHorizontal> {
  int counter= 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Container(
            height: 3.5 * SizeConfig.heightMultiplier,
            width: 3.5 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                  ),
                ]),
            child: IconButton(
              iconSize: 15,
              icon: Icon(
                Icons.remove,
                color: Theme.of(context).accentColor,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter > widget.minValue) {
                    counter--;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            height: 3.5 * SizeConfig.heightMultiplier,
            width: 3.5 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                  ),
                ]),
            child: IconButton(
              iconSize: 15,
              icon: Icon(
                Icons.add,
                color: Theme.of(context).accentColor,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter < widget.maxValue) {
                    counter++;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}