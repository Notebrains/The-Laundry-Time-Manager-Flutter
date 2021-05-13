import 'package:flutter/material.dart';
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
      body: Column(
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

              onTap: (){
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
                    onTap: null),

                TxtIcRow(
                  txt: 'Durgapur, Bardawn, WB, 7000045, India',
                  txtColor: Colors.blueGrey,
                  txtSize: 14,
                  fontWeight: FontWeight.normal,
                  icon: Icons.location_history,
                  icColor: Colors.blueGrey.withOpacity(0.8),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                      margin: const EdgeInsets.only(right: 12, top: 8),
                      decoration: new BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child:
                      Txt(txt: 'Order Id - ${response[position].orderId}', txtColor: Colors.white, txtSize: 14, fontWeight: FontWeight.normal, padding: 0, onTap: null),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                      margin: const EdgeInsets.only(top: 8),
                      decoration: new BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child:
                      Txt(txt: response[position].orderDate, txtColor: Colors.white, txtSize: 14, fontWeight: FontWeight.normal, padding: 0, onTap: null),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              //height: 500,
              //padding: EdgeInsets.only( left: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: response[position].orderItems.length > 0,
                    child: Container(
                      height: 300,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListView.builder(
                          itemCount: response[position].orderItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return response[position].orderItems[index].offerItems.length > 0
                                ? ExpansionTile(
                                    title: ExpandedListWidget(
                                      name: response[position].orderItems[index].itemName,
                                      categoryName: 'Cloth, Men Wear',
                                      price:  response[position].orderItems[index].itemPrice,
                                      qty:  response[position].orderItems[index].itemQty,
                                      image:  response[position].orderItems[index].itemImage,
                                    ),
                                    children: List<Widget>.generate(
                                      response[position].orderItems[index].offerItems.length,
                                      (i) => ExpandedListWidget(
                                        name: response[position].orderItems[index].offerItems[i].itemName,
                                        categoryName: 'Cloth, Men Wear',
                                        price:  response[position].orderItems[index].itemPrice,
                                        qty:  response[position].orderItems[index].itemQty,
                                        image:  response[position].orderItems[index].itemImage,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 50),
                                    child: ExpandedListWidget(
                                      name: response[position].orderItems[index].itemName,
                                      categoryName: 'Cloth, Men Wear',
                                      price:  response[position].orderItems[index].itemPrice,
                                      qty:  response[position].orderItems[index].itemQty,
                                      image:  response[position].orderItems[index].itemImage,
                                    ),
                                  );
                          }),
                    ),
                  ),


                  Visibility(
                    visible: response[position].orderItems.length > 0,
                    child: TxtTxtTxtRow(
                        text1: 'Total \$100.00',
                        text2: 'Discount \$20.00',
                        text3: 'Payable \$80.00',
                        text1Color: Colors.black,
                        text2Color: Colors.black,
                        bgColor: Colors.lightBlueAccent.withOpacity(0.2),
                    ),
                  ),

                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.fromLTRB(16, 12, 16, 5),
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
                          text2: '24th jan, 2021',
                          text3: '10:30',
                          text1Color: Colors.black54,
                          text2Color: Colors.black54,
                          bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                        ),

                        TxtTxtTxtRow(
                          text1: 'Address: Durgapur, Bardawn, WB, 7000045, India',
                          text2: '',
                          text3: '',
                          text1Color: Colors.black54,
                          text2Color: Colors.black54,
                          bgColor: Colors.lightBlueAccent.withOpacity(0.1),
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
                          text1: 'Address: Durgapur, Bardawn, WB, 7000045, India',
                          text2: '',
                          text3: '',
                          text1Color: Colors.black54,
                          text2Color: Colors.black54,
                          bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 8,),
                          child: TxtTxtTxtRow(
                            text1: 'Driver name',
                            text2: '24th jan, 2021',
                            text3: '10:30',
                            text1Color: Colors.black54,
                            text2Color: Colors.black54,
                            bgColor: Colors.lightBlueAccent.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
