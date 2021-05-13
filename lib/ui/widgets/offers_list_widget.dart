import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/attention_seekers/pulse.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersListWidget extends StatelessWidget {
  final Function onTapOnList;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;

  OffersListWidget({
    Key key,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = [];
    if (dataList.isEmpty) {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12, top: 5),
                    child: cachedNetImgWithRadius(
                      Strings.imgUrlFirebaseBulkOrder,
                      7.5 * SizeConfig.heightMultiplier,
                      7.5 * SizeConfig.heightMultiplier,
                      6,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 55.0 * SizeConfig.widthMultiplier,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Wash 2 & Get 1 Wash Free',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                        ),
                        child: Text(
                          "Cloth, Men's Wear",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 2,
                          top: 2,
                        ),
                        child: Text(
                          'Wash and fold',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                        ),
                      ),
                      Text(
                        'Amount-\$100.00',
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
                          'Valid till 25th May, 2021',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),

                  Padding(
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
                  ),
                ],
              ),
              onTap: () {
                  onTapOnBtn(index);
              },
            ),
          );
        },
      );
    } else {
      return NoDataFound(txt: 'No data found');
    }
  }
}
