import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/orders_res_model.dart';

class OrdersListWidget extends StatelessWidget {
  final List<Response> response;
  final Function(int index) onTapOnList;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;

  OrdersListWidget({
    Key key,
    @required this.response,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        //color: Colors.white,
        child: ListView.builder(
            itemCount: response.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                  txt: 'ORDER ID - ${response[index].orderId}',
                                  txtColor: Colors.black54,
                                  txtSize: 14,
                                  fontWeight: FontWeight.bold,
                                  padding: 3,
                                  onTap: null),
                              TxtWithWidth(
                                txt: response[index].orderDate,
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,
                              ),

                              TxtWithWidth(
                                txt: response[index].orderType,
                                txtColor: Colors.blueAccent,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: TxtWithWidth(
                                  txt: response[index].customerName,
                                  txtColor: Colors.black54,
                                  txtSize: 16,
                                  fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,
                                ),
                              ),
                              TxtWithWidth(
                                txt: 'Durgapur, Bardawn, WB, 7000045, India',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: response[index].totalItems.bitLength > 0,
                                child: Txt(
                                  txt: '${response[index].totalItems} ITEMS',
                                  txtColor: Colors.blueAccent,
                                  txtSize: 14,
                                  fontWeight: FontWeight.bold,
                                  padding: 5,
                                  onTap: () {
                                    onTapOnItems(index);
                                  },
                                ),
                              ),
                              Txt(
                                  txt: '\$${response[index].orderAmount} (paid)',
                                  txtColor: Colors.green,
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,
                                  padding: 3,
                                  onTap: null),
                              TxtWithWidth(
                                txt: 'Pickup: ${response[index].pickup}',
                                txtColor: Colors.black54,
                                txtSize: 14,
                                fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,
                              ),
                              Visibility(
                                visible: response[index].dropoff.isNotEmpty,
                                child: TxtWithWidth(
                                  txt: 'Drop off: ${response[index].dropoff}',
                                  txtColor: Colors.black54,
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,
                                ),
                              ),

                              Container(
                                height: 25,
                                margin: const EdgeInsets.only(bottom: 8, top: 5),
                                padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(response[index].paymentStatus,
                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                onTap: (){
                  onTapOnList(index);
                },
              );
            }),
      );
    } else {
      return NoDataFound(txt: 'No data found');
    }
  }
}
