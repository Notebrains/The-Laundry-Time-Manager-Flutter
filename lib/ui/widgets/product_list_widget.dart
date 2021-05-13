import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class ProductListWidget extends StatelessWidget {
  final Function onTapOnList;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;

  ProductListWidget({
    Key key,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = [];
    if (dataList.isEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        //color: Colors.white,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey[300]),
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5, bottom: 3),
                                    child: cachedNetImgWithRadius(
                                        Strings.imgUrlFirebaseBulkOrder,
                                        5.5 * SizeConfig.heightMultiplier,
                                        5.5 * SizeConfig.heightMultiplier, 3),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Txt(
                                        txt: 'PRODUCT NAME'.toUpperCase(),
                                        txtColor: Colors.black54,
                                        txtSize: 14,
                                        fontWeight: FontWeight.bold,
                                        padding: 3,
                                        onTap: null,
                                      ),
                                      TxtWithWidth(
                                        txt: 'ID - TLT003562',
                                        txtColor: Colors.black54,
                                        txtSize: 14,
                                        fontWeight: FontWeight.normal,
                                        width: 30 * SizeConfig.widthMultiplier,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TxtWithWidth(
                                txt: 'Raymond Coat, Men Wear',
                                txtColor: Colors.black54,
                                txtSize: 13,
                                fontWeight: FontWeight.normal,
                                width: 50 * SizeConfig.widthMultiplier,
                              ),
                              Container(
                                height: 3.1 * SizeConfig.heightMultiplier,
                                width: 22 * SizeConfig.heightMultiplier,
                                //color: Colors.grey[100],
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (6 > 0)
                                        for (int i = 0; i < 5; i++)
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              color: Colors.white,
                                              border: Border.all(color: AppTheme.selectedTabBackgroundColor.withOpacity(0.5)),
                                            ),
                                            margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                                            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                            child: Text(
                                              'addon ${i + 1}',
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
                            ],
                          ),
                          onTap: onTapOnList,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              txt: 'Laundry \$10.00',
                              txtColor: Colors.black54,
                              txtSize: 14,
                              fontWeight: FontWeight.normal,
                              padding: 3,
                              onTap: () {
                                onTapOnItems(index);
                              },
                            ),

                            Txt(
                                txt: 'Dry Cleaning \$10.00',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                                padding: 3,
                                onTap: null),

                            Txt(
                                txt: 'Press only \$10.00',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                                padding: 3,
                                onTap: null),

                            Txt(
                                txt: 'Wash & fold \$10.00',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                                padding: 3,
                                onTap: null),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      );
    } else {
      return NoDataFound(txt: 'No data found');
    }
  }
}
