import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/orders_res_model.dart';

class CustomerDetails extends StatefulWidget {
  final String customerId;
  final String customerName;

  const CustomerDetails({Key key, this.customerId, this.customerName}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<CustomerDetails> {
  TextEditingController controller = TextEditingController();
  String pickDate = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    apiBloc.fetchCustomerOrdersApi(widget.customerId);
    return Scaffold(
      appBar: appBarIcBack(context, '${widget.customerName} Order'),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: apiBloc.customerOrdersApi,
        builder: (context, AsyncSnapshot<OrdersResModel> snapshot) {
          if (snapshot.hasData && snapshot.data.status == 1 && snapshot.data.message == 'Success') {
            return LiquidPullToRefresh(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              onRefresh: () {
                return Future.delayed(
                  Duration(milliseconds: 700),
                  () {
                    buildUi(snapshot.data.response);
                  },
                );
              },
              child: buildUi(snapshot.data.response),
            );
          } else if (snapshot.hasError) {
            return SomethingWrongScreen(onTap: () {});
          } else if (!snapshot.hasData) {
            return TltProgressbar();
          } else
            return NoDataFound(txt: 'No data found', onRefresh: (){
              setState(() {

              });
            },);
        },
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    //print('----${offerList.length}');
    return Column(
      children: [
        Expanded(
          child: SlideInUp(
            child: CustomerOrdersDetailsListWidget(
              response: response,
              onTapOnList: (index) {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OrderDetails(response: response, position: index),
                  ),
                );*/
              },
              onTapOnBtn: (value) {},
              onTapOnItems: (index) {
                showBottomSheetUi(response, index);
              },
              onRefresh: (){setState(() {});},
            ),
          ),
        ),
      ],
    );
  }

  showBottomSheetUi(List<Response> response, int position) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
            return Container(
              height: 500,
              margin: const EdgeInsets.only(bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: response[position].orderItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return response[position].orderItems[index].offerItems.length > 0
                              ? ExpansionTile(
                                  title: ExpandedListWidget(
                                    name: response[position].orderItems[index].itemName,
                                    categoryName: 'Cloth, Men Wear',
                                    price: response[position].orderItems[index].itemPrice,
                                    qty: response[position].orderItems[index].itemQty,
                                    image: response[position].orderItems[index].itemImage,
                                  ),
                                  children: List<Widget>.generate(
                                    response[position].orderItems[index].offerItems.length,
                                    (i) => ExpandedListWidget(
                                      name: response[position].orderItems[index].offerItems[i].itemName,
                                      categoryName: 'Cloth, Men Wear',
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
                                    categoryName: 'Cloth, Men Wear',
                                    price: response[position].orderItems[index].itemPrice,
                                    qty: response[position].orderItems[index].itemQty,
                                    image: response[position].orderItems[index].itemImage,
                                  ),
                                );
                        }),
                  ),
                ],
              ),
            );
          });
        });
  }
}
