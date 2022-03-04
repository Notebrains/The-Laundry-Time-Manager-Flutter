import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/pick_up_res_model.dart';

class PickUp extends StatefulWidget {
  static const String routeName = '/pickup';

  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  TextEditingController controller = TextEditingController();
  String fromDateStr = '', toDateStr = '';
  DateTime fromDate;
  DateTime toDate;
  List<Response> _searchResult = [];
  List<Response> listData = [];

  @override
  void initState() {
    super.initState();
    apiBloc.fetchPickUpListsApi('', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(context, 'Pick Up'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: LiquidPullToRefresh(
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        onRefresh: () {
          return Future.delayed(
            Duration(milliseconds: 700),
            () {
              buildUi();
            },
          );
        },
        child: buildUi(),
      ),
    );
  }

  Widget buildUi() {
    return Column(
      children: [
        SlideInDown(
          child: Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Card(
              elevation: 1,
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Search order id, customer name...', border: InputBorder.none),
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
        ),
        SlideInLeft(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(bottom: 5, top: 8, left: 16, right: 4),
                    //padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey[300]),
                    ),
                    alignment: Alignment.center,
                    child: TxtIcRow(
                        txt: fromDateStr.isEmpty ? '  FROM DATE' : fromDateStr,
                        txtColor: Colors.black54,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        icon: Icons.date_range_outlined,
                        icColor: Colors.green),
                  ),
                  onTap: () {
                    pickDateFromDatePicker();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(bottom: 5, top: 8, left: 4, right: 4),
                    //padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey[300]),
                    ),
                    alignment: Alignment.center,
                    child: TxtIcRow(
                        txt: toDateStr.isEmpty ? '  TO DATE' : toDateStr,
                        txtColor: Colors.black54,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        icon: Icons.date_range_outlined,
                        icColor: Colors.blueAccent),
                  ),
                  onTap: () {
                    pickToDatePicker();
                  },
                ),
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 5, top: 8, left: 4, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey[300]),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  if (fromDateStr.isNotEmpty && toDateStr.isNotEmpty) {
                    showSnackBar(context, 'Loading data...');
                    setState(() {
                      apiBloc.fetchPickUpListsApi(formatDateForServer(fromDate), formatDateForServer(toDate));
                    });
                  } else
                    showToast(context, 'Please select both dates!');
                },
              ),
            ],
          ),
        ),

        StreamBuilder(
          stream: apiBloc.pickUpListsApi,
          builder: (context, AsyncSnapshot<PickUpResModel> snapshot) {
            if (snapshot.hasData && snapshot.data.status == 1 && snapshot.data.message != "No data found" ) {
              return buildListUi(snapshot.data.response);
            } else if (snapshot.hasError) {
              return SomethingWrongScreen(onTap: () {});
            } else if (!snapshot.hasData) {
              return TltProgressbar();
            } else
              return NoDataFound(txt: 'No data found', onRefresh: (){
                print('---- : onRefresh order');
                fromDateStr = '';
                toDateStr = '';
                showSnackBar(context, 'Loading data...');
                setState(() {
                  apiBloc.fetchPickUpListsApi('', '');
                });
            },);
          },
        )
      ],
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listData.forEach((model) {
      if (model.orderId.toLowerCase().contains(text.toLowerCase()) ||
          model.customerName.toLowerCase().contains(text.toLowerCase()) ||
          model.driverName.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }

  Widget buildListUi(List<Response> response) {
    return Expanded(
      child: SlideInUp(
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          child: ListView.builder(
              itemCount: _searchResult.length != 0 || controller.text.isNotEmpty? _searchResult.length : response.length,
              itemBuilder: (BuildContext context, int index) {
                if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                  return PickUpListWidget(
                    response: _searchResult,
                    index: index,
                    onTapOnList: () {
                      //Navigator.pushNamed(context, Routes.order_details_screen);
                    },
                    onTapOnBtn: (value) {},
                    onTapOnItems: (index) {
                      showBottomSheetUi(_searchResult[index].itemDetails, index, _searchResult);
                    },
                    onRefresh: (){
                      setState(() {
                      controller.clear();
                      onSearchTextChanged('');
                    });},
                  );
                } else {
                  listData = response;
                  return PickUpListWidget(
                    response: listData,
                    index: index,
                    onTapOnList: () {
                      //Navigator.pushNamed(context, Routes.order_details_screen);
                    },
                    onTapOnBtn: (value) {},
                    onTapOnItems: (index) {
                      showBottomSheetUi(listData[index].itemDetails, index, listData);
                    },
                    onRefresh: (){setState(() {
                      showSnackBar(context, 'Loading data...');
                      apiBloc.fetchPickUpListsApi('', '');
                    });},
                  );
                }
              },
          ),
        ),
      ),
    );
  }

  void pickDateFromDatePicker() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      fromDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
      DateTime picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          firstDate: DateTime.now().subtract(Duration(days: 15000)),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDate: fromDate,
          helpText: 'SELECT DATE',
          // Can be used as title
          cancelText: 'NOT NOW',
          confirmText: 'CONFIRM',
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                textTheme: TextTheme(bodyText2: TextStyle(color: Colors.green)),
              ),
              child: child,
            );
          });

      if (picked != null) {
        if (picked != null && picked != fromDate)
          setState(() {
            fromDate = picked;
            fromDateStr = formatDateForUs(fromDate);
          });
      }
    });
  }

  void pickToDatePicker() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      toDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
      DateTime picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          firstDate: DateTime.now().subtract(Duration(days: 15000)),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDate: toDate,
          helpText: 'SELECT DATE',
          // Can be used as title
          cancelText: 'NOT NOW',
          confirmText: 'CONFIRM',
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                textTheme: TextTheme(bodyText2: TextStyle(color: Colors.green)),
              ),
              child: child,
            );
          });

      if (picked != null) {
        if (picked != null && picked != toDate)
          setState(() {
            toDate = picked;
            toDateStr = formatDateForUs(toDate);
          });
      }
    });
  }

  showBottomSheetUi(List<Item_details> itemDetails, int position, List<Response> listData) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
            return Container(
              height: 700,
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
                          text2: listData[position].itemTotal.toString(),
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Quantity',
                          text2: listData[position].totalItems.toString(),
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Addon charges',
                          text2: '\$ ${listData[position].totalAddonPrice}',
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Discount',
                          text2: '\$ ${listData[position].offerDiscount}',
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        Visibility(
                          visible: listData[position].taxAmount != '0.00',
                          child: TxtLeftRightRow(
                            text1: 'Tax amount',
                            text2: '\$ ${listData[position].taxAmount}',
                            text1Color: Colors.black38,
                            text2Color: Colors.black38,
                          ),
                        ),
                        Visibility(
                          visible: listData[position].serviceCharge != '0.00',
                          child: TxtLeftRightRow(
                            text1: 'Service charges',
                            text2: '\$ ${listData[position].serviceCharge}',
                            text1Color: Colors.black38,
                            text2Color: Colors.black38,
                          ),
                        ),


                        TxtLeftRightRow(
                          text1: 'Minimum service fee',
                          text2: listData[position].cutoffCharge,
                          text1Color: Colors.black38,
                          text2Color: Colors.black38,
                        ),
                        TxtLeftRightRow(
                          text1: 'Area service fee',
                          text2: listData[position].zipcodeDeliveryCharge,
                          text1Color: Colors.black38,
                          text2Color:  Colors.black38,
                        ),


                        TxtLeftRightRow(
                          text1: listData[position].deliveryType == '1' ? 'Regular service fee' : 'Express service fee',
                          text2: listData[position].deliveryCharges == '0.00' ? 'Free' : '\$ ${listData[position].deliveryCharges}',
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
                          text2: '\$ ${listData[position].orderAmount}',
                          text1Color: Colors.black54,
                          text2Color: Colors.black54,
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: itemDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return itemDetails[index].offerItems.length > 0
                              ? ExpansionTile(
                                  title: ExpandedListWidget(
                                    name: itemDetails[index].itemName,
                                    categoryName: '',
                                    price: itemDetails[index].itemPrice,
                                    qty: itemDetails[index].itemQty,
                                    image: itemDetails[index].itemImage,
                                  ),
                                  children: List<Widget>.generate(
                                    itemDetails[index].offerItems.length,
                                    (i) => ExpandedListWidget(
                                      name: itemDetails[index].offerItems[i].itemName,
                                      categoryName: itemDetails[index].itemFor,
                                      price: '',
                                      qty: itemDetails[index].offerItems[i].itemQty,
                                      image: itemDetails[index].offerItems[i].itemImage,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                  child: ExpandedListWidget(
                                    name: itemDetails[index].itemName,
                                    categoryName: '',
                                    price: itemDetails[index].itemPrice,
                                    qty: itemDetails[index].itemQty,
                                    image: itemDetails[index].itemImage,
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
