import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';

class OffersListWidget extends StatelessWidget {
  final List<Offers_list> response;
  final int index;
  final Function onTapOnList;
  final Function onRefresh;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;

  OffersListWidget({
    Key key,
    @required this.response,
    @required this.index,
    @required this.onRefresh,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.05),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.grey[50]),
        ),
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: EdgeInsets.only(bottom: 5, top: 5),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 5),
                child: cachedNetImgWithRadius(
                  response[index].image,
                  5.5 * SizeConfig.heightMultiplier,
                  5.5 * SizeConfig.heightMultiplier,
                  5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 35.0 * SizeConfig.widthMultiplier,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, right: 5),
                      child: Text(
                        response[index].name,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35.0 * SizeConfig.widthMultiplier,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: Text(
                        "${response[index].subcategory}, ${response[index].category}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 2,
                      top: 2,
                    ),
                    child: Text(
                      response[index].productionType,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                  Text(
                    'Amount-\$${response[index].price}',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4,
                      top: 2,
                    ),
                    child: Text(
                      'Valid till ${response[index].validity}',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: response[index].offerItems.length > 0,
                    child: Container(
                      //height: 3.1 * SizeConfig.heightMultiplier,
                      width: 35.0 * SizeConfig.widthMultiplier,
                      //color: Colors.grey[100],
                      padding: const EdgeInsets.only(top: 8),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (response[index].offerItems.length > 0)
                              for (int i = 0; i < response[index].offerItems.length; i++)
                                Txt(
                                  txt: '${response[index].offerItems[i].itemName} (qty-${response[index].offerItems[i].itemQty})',
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

              /*Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Pulse(
                  child: Icon(
                    Icons.filter_list_rounded,
                    semanticLabel: 'Items',
                    size: 25,
                    color: Colors.blueGrey,
                  ),
                  preferences: AnimationPreferences(duration: const Duration(milliseconds: 1200), autoPlay: AnimationPlayStates.Loop),
                ),
              ),*/
            ],
          ),
          onTap: () {
            onTapOnList();
          },
        ),
      );
    } else {
      return NoDataFound(txt: 'No data found', onRefresh: onRefresh,);
    }
  }
}
