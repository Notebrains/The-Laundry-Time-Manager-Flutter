import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

class NumericStepButtonVertical extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  NumericStepButtonVertical(
      {Key key, this.minValue = 1, this.maxValue = 100, this.onChanged})
      : super(key: key);

  @override
  State<NumericStepButtonVertical> createState() {
    return _NumericStepButtonVerticalState();
  }
}

class _NumericStepButtonVerticalState extends State<NumericStepButtonVertical> {

  int counter= 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: ClipOval(
              child: Material(
                color: Colors.transparent, // button color
                child: InkWell(
                  splashColor: Colors.blue, // inkwell color
                  child: SizedBox(
                    width: 4.0 * SizeConfig.heightMultiplier,
                    height: 4.0 * SizeConfig.heightMultiplier,
                    child: Icon(
                      Icons.remove,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onTap:  () {
                    setState(() {
                      if (counter > widget.minValue) {
                        counter--;
                      }
                      widget.onChanged(counter);
                    });
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
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

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: ClipOval(
              child: Material(
                color: Colors.transparent, // button color
                child: InkWell(
                  splashColor: Colors.blue, // inkwell color
                  child: SizedBox(
                    width: 4.0 * SizeConfig.heightMultiplier,
                    height: 4.0 * SizeConfig.heightMultiplier,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onTap:  () {
                    setState(() {
                      if (counter < widget.maxValue) {
                        counter++;
                      }
                      widget.onChanged(counter);
                    });
                  },
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}