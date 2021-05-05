import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class ListDataWidgetPremiumPickUp extends StatelessWidget {
  final Function onTapOnList;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;

  ListDataWidgetPremiumPickUp({
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
        color: Colors.white,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                decoration: BoxDecoration(
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
                              Txt(
                                  txt: 'ORDER ID - TLT003562',
                                  txtColor: Colors.black54,
                                  txtSize: 14,
                                  fontWeight: FontWeight.bold,
                                  padding: 3,
                                  onTap: null),
                              TxtIcRow(
                                txt: 'Date: 4th Jan, 2021',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              ),

                              TxtIcRow(
                                txt: 'Premium order',
                                txtColor: Colors.blueAccent,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              TxtIcRow(
                                txt: 'Tanay Mitra',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              TxtIcRow(
                                txt: 'Durgapur, Bardawn, West Bengal, 7000045, India',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              )
                            ],
                          ),
                          onTap: onTapOnList,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              txt: '8 items',
                              txtColor: Colors.blueAccent,
                              txtSize: 14,
                              fontWeight: FontWeight.bold,
                              padding: 5,
                              onTap: () {
                                onTapOnItems(index);
                              },
                            ),
                            Txt(
                                txt: '\$70.00',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.bold,
                                padding: 3,
                                onTap: null),
                            TxtIcRow(
                              txt: 'Pickup (4th Jan, 2021\nat 2 pm)',
                              txtColor: Colors.black54,
                              txtSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            TxtIcRow(
                              txt: 'Drop off (4th Jan, 2021\nat 3 pm)',
                              txtColor: Colors.black54,
                              txtSize: 14,
                              fontWeight: FontWeight.normal,
                            ),

                            Container(
                              height: 28,
                              margin: const EdgeInsets.only(bottom: 8, top: 5),
                              padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              alignment: Alignment.center,
                              child: Text('Order Status',
                                style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
                              ),
                            ),
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
