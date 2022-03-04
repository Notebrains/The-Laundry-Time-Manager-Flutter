import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/product_res_model.dart';

class ProductListWidget extends StatelessWidget {
  final List<Response> response;
  final int index;
  final Function onTapOnList;
  final Function onRefresh;

  ProductListWidget({
    Key key,
    @required this.response,
    @required this.index,
    @required this.onTapOnList,
    @required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
        margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey[200]),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(right: 5, bottom: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.blueGrey.withOpacity(0.1)),
                            ),
                            child: cachedNetImgWithRadius(
                                response[index].image, 5.5 * SizeConfig.heightMultiplier, 5.5 * SizeConfig.heightMultiplier, 3),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TxtWithWidth(
                                txt: response[index].itemName.toUpperCase(),
                                txtColor: Colors.black54,
                                txtSize: 13,
                                fontWeight: FontWeight.bold,
                                width: 30 * SizeConfig.widthMultiplier,
                              ),
                              TxtWithWidth(
                                txt: 'ID - ${response[index].id}',
                                txtColor: Colors.black54,
                                txtSize: 13,
                                fontWeight: FontWeight.normal,
                                width: 30 * SizeConfig.widthMultiplier,
                              ),
                            ],
                          ),
                        ],
                      ),
                      TxtWithWidth(
                        txt: '${response[index].subcategory}, ${response[index].category}',
                        txtColor: Colors.black54,
                        txtSize: 13,
                        fontWeight: FontWeight.normal,
                        width: 50 * SizeConfig.widthMultiplier,
                      ),
                      Visibility(
                        visible: response[index].addonDetails.length > 0,
                        child: Container(
                          height: 3.1 * SizeConfig.heightMultiplier,
                          width: 22 * SizeConfig.heightMultiplier,
                          //color: Colors.grey[100],
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (response[index].addonDetails.length > 0)
                                  for (int i = 0; i < response[index].addonDetails.length; i++)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        color: Colors.white,
                                        border: Border.all(color: AppTheme.selectedTabBackgroundColor.withOpacity(0.5)),
                                      ),
                                      margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                      child: Text(
                                        response[index].addonDetails[i].addonName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: onTapOnList,
                ),

                Visibility(
                  visible: response[index].priceDetails.length > 0,
                  child: Container(
                    //height: 3.1 * SizeConfig.heightMultiplier,
                    width: 36 * SizeConfig.widthMultiplier,
                    //color: Colors.grey[100],
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (response[index].priceDetails.length > 0)
                            for (int i = 0; i < response[index].priceDetails.length; i++)
                              Txt(
                                txt: '${response[index].priceDetails[i].productionType} \$${response[index].priceDetails[i].price}',
                                txtColor: Colors.black54,
                                txtSize: 13,
                                fontWeight: FontWeight.normal,
                                padding: 3,
                                onTap: null,
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return NoDataFound(txt: 'No data found', onRefresh: onRefresh);
    }
  }
}
