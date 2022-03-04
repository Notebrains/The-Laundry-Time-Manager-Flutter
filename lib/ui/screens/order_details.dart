import 'package:flutter/material.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/orders_res_model.dart';

class OrderDetails extends StatelessWidget {
  final List<Response> response;
  final int position;

  const OrderDetails({Key key, this.response, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16, top: 45),
              color: Colors.lightBlue.withOpacity(0.4),
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: AppTheme.selectedTabBackgroundColor,
                  size: 30,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: 120,
              decoration: new BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.4),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(40, 40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Txt(
                      txt: response[position].customerName.toUpperCase(),
                      txtColor: Colors.blueGrey,
                      txtSize: 22,
                      fontWeight: FontWeight.normal,
                      padding: 0,
                      onTap: null,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                        margin: const EdgeInsets.only(right: 12, top: 25),
                        decoration: new BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Txt(
                            txt: 'Order Id - ${response[position].orderId}',
                            txtColor: Colors.white,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 0,
                            onTap: null,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                        margin: const EdgeInsets.only(top: 25),
                        decoration: new BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Txt(
                            txt: response[position].orderDate,
                            txtColor: Colors.white,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 0,
                            onTap: null),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Visibility(
              visible: response[position].orderItems.length > 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      "ORDERED ITEM",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
                    padding: EdgeInsets.only(bottom: 8, top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TxtLeftRightRow(
                          text1: 'Item total',
                          text2: response[position].itemTotal.toString(),
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Quantity',
                          text2: response[position].totalItems.toString(),
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Addon charges',
                          text2: '\$ ${response[position].totalAddonPrice}',
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Discount',
                          text2: '\$ ${response[position].offerDiscount}',
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        Visibility(
                          visible: response[position].taxAmount != '0.00',
                          child: TxtLeftRightRow(
                            text1: 'Tax amount',
                            text2: '\$ ${response[position].taxAmount}',
                            text1Color: Colors.black38,
                            text2Color: Colors.black38,
                          ),
                        ),
                        Visibility(
                          visible: response[position].serviceCharge != '0.00',
                          child: TxtLeftRightRow(
                            text1: 'Service charges',
                            text2: '\$ ${response[position].serviceCharge}',
                            text1Color: Colors.black38,
                            text2Color: Colors.black38,
                          ),
                        ),

                        TxtLeftRightRow(
                          text1: 'Minimum service fee',
                          text2: response[position].cutoffCharge,
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Area service fee',
                          text2: response[position].zipcodeDeliveryCharge,
                          text1Color: Colors.black38,
                          text2Color:  Colors.black38,
                        ),


                        TxtLeftRightRow(
                          text1: response[position].deliveryType == '1' ? 'Regular service fee' : 'Express service fee',
                          text2: response[position].deliveryCharges == '0.00' ? 'Free' : '\$ ${response[position].deliveryCharges}',
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 12, top: 3, bottom: 3),
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                        TxtLeftRightRow(
                          text1: 'Total payable',
                          text2: '\$ ${response[position].orderAmount}',
                          text1Color: Colors.black54,
                          text2Color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            Visibility(
              visible: response[position].orderItems.length > 0,
              child: Container(
                height: response[position].orderItems.length * 67.0,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListView.builder(
                    itemCount: response[position].orderItems.length,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return response[position].orderItems[index].offerItems.length > 0
                          ? ExpansionTile(
                              title: ExpandedListWidget(
                                name: response[position].orderItems[index].itemName,
                                categoryName: response[position].orderItems[index].itemFor,
                                price: response[position].orderItems[index].itemPrice,
                                qty: response[position].orderItems[index].itemQty,
                                image: response[position].orderItems[index].itemImage,
                              ),
                              children: List<Widget>.generate(
                                response[position].orderItems[index].offerItems.length,
                                (i) => ExpandedListWidget(
                                  name: response[position].orderItems[index].offerItems[i].itemName,
                                  categoryName: '',
                                  price: response[position].orderItems[index].itemPrice,
                                  qty: response[position].orderItems[index].itemQty,
                                  image: response[position].orderItems[index].itemImage,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 16, right: 50),
                              child: ExpandedListWidget(
                                name: response[position].orderItems[index].itemName,
                                categoryName: '',
                                price: response[position].orderItems[index].itemPrice,
                                qty: response[position].orderItems[index].itemQty,
                                image: response[position].orderItems[index].itemImage,
                              ),
                            );
                    }),
              ),
            ),

            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              decoration: new BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
                    child: Txt(
                      txt: 'Pick Up',
                      txtColor: Colors.blueGrey,
                      txtSize: 14,
                      fontWeight: FontWeight.bold,
                      padding: 0,
                      onTap: null,
                    ),
                  ),
                  TxtTxtTxtRow(
                    text1: 'Driver name',
                    text2: 'Date',
                    text3: 'Time',
                    text1Color: Colors.black54,
                    text2Color: Colors.black54,
                    bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                  ),
                  TxtTxtTxtRow(
                    text1: response[position].pickupDriver,
                    text2: response[position].pickupDate,
                    text3: response[position].pickupTime,
                    text1Color: Colors.black54,
                    text2Color: Colors.black54,
                    bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                  ),

                  Container(
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(left: 16.0, right: 16, top: 2),
                    child: Txt(txt: 'Address: ${response[position].pickupAddress}', txtColor:  Colors.black54, txtSize: 14,
                        fontWeight: FontWeight.normal, padding: 0, onTap: null),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
                    child: Txt(
                      txt: 'Drop Off',
                      txtColor: Colors.blueGrey,
                      txtSize: 14,
                      fontWeight: FontWeight.bold,
                      padding: 0,
                      onTap: null,
                    ),
                  ),

                  TxtTxtTxtRow(
                    text1: 'Driver name',
                    text2: 'Date',
                    text3: 'Time',
                    text1Color: Colors.black54,
                    text2Color: Colors.black54,
                    bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                  ),

                  Visibility(
                    child: TxtTxtTxtRow(
                      text1: response[position].dropoffDriver,
                      text2: response[position].dropoffDate,
                      text3: response[position].dropoffTime,
                      text1Color: Colors.black54,
                      text2Color: Colors.black54,
                      bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                    ),
                  ),

                  Container(
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(left: 16.0, right: 16, top: 2, bottom: 12),
                    child: Txt(
                      txt: 'Address: ${response[position].dropoffAddress}', txtColor:  Colors.black54, txtSize: 14,
                      fontWeight: FontWeight.normal, padding: 0, onTap: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
