import 'package:flutter/material.dart';
import 'package:tlt_manager/helper/libraries/blurry_container.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class BtnBulkOrderBannerImg extends StatelessWidget {
  final String imgUrl;
  final Function onTap;

  const BtnBulkOrderBannerImg({
    Key key,
    @required this.imgUrl,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17 * SizeConfig.heightMultiplier,
      margin: EdgeInsets.fromLTRB(16,12,16,0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white60,
            blurRadius: 5.0,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),

      child: BlurryContainer(
        width: double.infinity,
        blur: 0,
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        child: Stack(
          //alignment: Alignment.bottomLeft,
          children: [
            /*Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Text(
                Strings.txt_lorem_ipsum_mid,
                textAlign: TextAlign.start,
                style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.white),
              ),
            ),*/

            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 130,
                height: 40,
                child: BtnFullWidthSqIc(
                    text: 'Bulk order',
                    size: 14,
                    icon: Icons.shopping_bag,
                    txtColors: Colors.white,
                    bgColors: Colors.black38,
                    icColors: Colors.white,
                    onPressed: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}