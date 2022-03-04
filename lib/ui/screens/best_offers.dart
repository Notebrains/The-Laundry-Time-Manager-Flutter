import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';

class BestOffers extends StatefulWidget {
  final List<Offers_list> dataList;

  BestOffers({Key key, this.dataList}) : super(key: key);

  @override
  _BestOffersState createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  TextEditingController controller = TextEditingController();
  List<Offers_list> _searchResult = [];
  List<Offers_list> listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Name, cat, subcat, validity...', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
                trailing: Visibility(
                  visible: controller.text.isNotEmpty,
                  child: IconButton(
                    icon: Icon(Icons.cancel_outlined),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _searchResult.length != 0 || controller.text.isNotEmpty ? _searchResult.length : widget.dataList.length,
              itemBuilder: (context, index) {
                if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                  return OffersListWidget(
                    response: _searchResult,
                    index: index,
                    onTapOnList: () {
                      //Navigator.pushNamed(context, Routes.order_details_screen);
                    },
                    onTapOnBtn: (index) {
                      if (listData[index].customersDetails.isNotEmpty) {
                        showBottomSheetUi(listData[index].customersDetails);
                      } showSnackBar(context, 'No one used this voucher code');
                    },
                    onRefresh: () {
                      //setState(() {});
                    },
                  );
                } else {
                  listData = widget.dataList;
                  return OffersListWidget(
                    response: listData,
                    index: index,
                    onTapOnList: () {},
                    onTapOnBtn: (index) {
                      if (listData[index].customersDetails.isNotEmpty) {
                        showBottomSheetUi(listData[index].customersDetails);
                      } showSnackBar(context, 'No one used this voucher code');
                    },
                    onRefresh: () {
                      //setState(() {});
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listData.forEach((model) {
      if (model.name.toLowerCase().contains(text.toLowerCase()) ||
          model.validity.toLowerCase().contains(text.toLowerCase()) ||
          model.productionType.toLowerCase().contains(text.toLowerCase()) ||
          model.category.toLowerCase().contains(text.toLowerCase()) ||
          model.subcategory.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }

  showBottomSheetUi(List<Customers_details> customerDetails) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
          return Container(
            height: 500,
            //padding: EdgeInsets.only( left: 0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "Number Of Users",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: ListView.builder(
                        itemCount: customerDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: Colors.grey[300]
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                  ),
                                  child: Text(
                                    customerDetails[index].name,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 5, right: 5),
                                  child: Text(
                                    'Order Id - ${customerDetails[index].orderId}',
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style:
                                    TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black54),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(top: 5, right: 5),
                                  child: Text(
                                    'Date - ${customerDetails[index].orderDate}',
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style:
                                    TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black54),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 2,
                                    top: 2,
                                  ),
                                  child: Text(
                                    'Mob - ${customerDetails[index].mobile}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 2,
                                    top: 2,
                                  ),
                                  child: Text(
                                    'Zip code - ${customerDetails[index].location}',//change here
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
