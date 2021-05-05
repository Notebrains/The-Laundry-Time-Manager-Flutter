import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class BottomSheetItemDetailsUi extends StatelessWidget {
  final String name;
  final String image;
  final String categoryName;
  final String qty;
  final String price;

  const BottomSheetItemDetailsUi({Key key, this.name, this.image, this.categoryName, this.qty, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 80 * SizeConfig.widthMultiplier,
      margin: EdgeInsets.only(right: 12),
      //padding: const EdgeInsets.only(left: 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: cachedNetImgWithRadius(
                  image, 13 * SizeConfig.widthMultiplier,
                  13 * SizeConfig.widthMultiplier, 3,
                ),
              ),

              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Visibility(
                            visible: categoryName.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                categoryName,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 13, fontFamily: 'Roboto', fontWeight: FontWeight.normal, color: Colors.grey),
                              ),
                            ),
                          ),

                          Text(
                            'QTY: $qty',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.normal, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: price.isNotEmpty,
                child: Expanded(
                  flex: 1,
                  child: Text(
                    '\$$price',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Colors.lightGreenAccent[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}