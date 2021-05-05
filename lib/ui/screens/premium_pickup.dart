import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/premium_pick_up_res_model.dart';

class PremiumPickUp extends StatefulWidget {
  final String driverId;

  const PremiumPickUp({Key key, this.driverId}) : super(key: key);

  @override
  _PremiumPickUpState createState() => _PremiumPickUpState();
}

class _PremiumPickUpState extends State<PremiumPickUp> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print('----Driver Id: ${widget.driverId}');

    apiBloc.fetchPremiumPickupListsApi(widget.driverId);
    // Create TabController for getting the index of current tab
    _controller = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.green,
        indicatorWeight: 3,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(5), // Creates border
            color: Colors.greenAccent),
        controller: _controller,
        tabs: [
          Tab(
            text: 'CURRENT',
          ),
          Tab(
            text: 'PENDING',
          ),
          Tab(
            text: 'PAST',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithMoreOption(context, 'PREMIUM LAUNDRY PICKUP', _tabBar),
        body: StreamBuilder(
          stream: apiBloc.premiumPickupListApi,
          builder: (context, AsyncSnapshot<PremiumPickUpResModel> snapshot) {
            if (snapshot.hasData && snapshot.data.status == 1 && snapshot.data.message == 'Success') {
              final currentList = snapshot.data.response.current;
              final pendingList = snapshot.data.response.pending;
              final pastList = snapshot.data.response.history;

              return TabBarView(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                children: [
                  ListDataWidgetPremiumPickUp(
                    onTapOnList: () {},
                    onTapOnBtn: (index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => Home()),
                      );
                    },
                    onTapOnItems: (index) {
                      showBottomSheetUi(currentList[index].premiumCurrentPickupItemDetails, currentList[index].totalItems,
                          currentList[index].orderAmount);
                    },
                  ),
                  ListDataWidgetPremiumPickUp(
                    onTapOnList: () {},
                    onTapOnBtn: (index) async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Request(
                              title: 'Pick Up',
                              date: pendingList[index].pickupDate,
                              time: pendingList[index].pickupTime,
                              address:
                                  '${pendingList[index].street}-${pendingList[index].city}, zip code-${pendingList[index].zipCode}, ${pendingList[index].country}',
                              mobile: pendingList[index].contactMobile,
                              qty: '${pendingList[index].totalItems.toString()} Items',
                              requestType: 'Pickup',
                              orderId: pendingList[index].orderId),
                        ),
                      );
                      //refresh page
                      setState(() {});
                    },
                    onTapOnItems: (index) {
                      showBottomSheetUi(pendingList[index].premiumPendingPickupItemDetails, pendingList[index].totalItems,
                          pendingList[index].orderAmount);
                    },
                  ),
                  ListDataWidgetPremiumPickUp(
                    onTapOnList: () {},
                    onTapOnBtn: (value) {},
                    onTapOnItems: (index) {
                      showBottomSheetUi(
                        pastList[index].premiumHistoryPickupItemDetails,
                        pastList[index].totalItems,
                        pastList[index].orderAmount,
                      );
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return SomethingWrongScreen(onTap: () {
                setState(() {});
              });
            } else if (!snapshot.hasData) {
              return TltProgressbar();
            } else
              return NoDataFound(txt: 'No service found');
          },
        ));
  }

  showBottomSheetUi(final itemDetails, int totalItems, String orderAmount) {
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
                        itemCount: itemDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return itemDetails[index].offerItems.length > 0
                              ? ExpansionTile(
                                  title: BottomSheetItemDetailsUi(
                                    name: itemDetails[index].itemName,
                                    categoryName: itemDetails[index].category,
                                    price: itemDetails[index].itemPrice,
                                    qty: itemDetails[index].itemQty,
                                    image: itemDetails[index].itemImage,
                                  ),
                                  children: List<Widget>.generate(
                                    itemDetails[index].offerItems.length,
                                    (i) => BottomSheetItemDetailsUi(
                                      name: itemDetails[index].offerItems[i].itemName,
                                      categoryName: '',
                                      price: '',
                                      qty: itemDetails[index].offerItems[i].itemQty,
                                      image: itemDetails[index].offerItems[i].itemImage,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 50),
                                  child: BottomSheetItemDetailsUi(
                                    name: itemDetails[index].itemName,
                                    categoryName: itemDetails[index].category,
                                    price: itemDetails[index].itemPrice,
                                    qty: itemDetails[index].itemQty,
                                    image: itemDetails[index].itemImage,
                                  ),
                                );
                        }),
                  ),
                  TxtTxtTxtRow(
                      text1: 'TOTAL',
                      text2: totalItems.toString(),
                      text3: '\$$orderAmount',
                      text1Color: Colors.black87,
                      text2Color: Colors.black87),
                ],
              ),
            );
          });
        });
  }
}
