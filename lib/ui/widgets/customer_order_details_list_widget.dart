import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/customer_orders_res_model.dart';

class CustomerOrdersDetailsListWidget extends StatelessWidget {
  final List<Order_details> response;
  final Function(int index) onTapOnList;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;
  final Function onRefresh;

  CustomerOrdersDetailsListWidget({
    Key key,
    @required this.response,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
    @required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 12, top: 8),
        //color: Colors.white,
        child: ListView.builder(
            itemCount: response.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  padding: const EdgeInsets.all(12),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                  txt: 'ORDER ID - ${response[index].orderId}',
                                  txtColor: Colors.blueGrey,
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
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: response[index].totalItems.bitLength > 0,
                                child: Row(
                                  children: [
                                    Txt(
                                      txt: '${response[index].totalItems} ITEMS',
                                      txtColor: Colors.blueAccent,
                                      txtSize: 14,
                                      fontWeight: FontWeight.bold,
                                      padding: 0,
                                      onTap: () {
                                        onTapOnItems(index);
                                      },
                                    ),

                                    Icon(Icons.arrow_drop_down, color: Colors.grey, size: 30,),
                                  ],
                                ),
                              ),
                              Txt(
                                  txt: '\$${response[index].orderAmount}',
                                  txtColor: Colors.green,
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,
                                  padding: 3,
                                  onTap: null),
                              /*TxtWithWidth(
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
                              ),*/

                              Container(
                                height: 25,
                                margin: const EdgeInsets.only(bottom: 8, top: 5),
                                padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: response[index].paymentStatus.toLowerCase() == 'completed'? Colors.green: Colors.blueAccent),
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
      return NoDataFound(txt: 'No data found', onRefresh: onRefresh,);
    }
  }
}
