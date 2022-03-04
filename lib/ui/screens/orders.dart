import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/orders_res_model.dart';

class Orders extends StatefulWidget {
  static const String routeName = '/orders';

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController controller = TextEditingController();
  String fromDateStr = '', toDateStr = '';
  DateTime fromDate;
  DateTime toDate;
  List<Response> _searchResult = [];
  List<Response> listData = [];

  @override
  void initState() {
    super.initState();
    apiBloc.fetchOrdersApi('', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(context, 'Orders'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: Column(
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey[400]),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey[400]),
                      ),
                      alignment: Alignment.center,
                      child: TxtIcRow(
                        txt: toDateStr.isEmpty ? '  TO DATE' : toDateStr,
                        txtColor: Colors.black54,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        icon: Icons.date_range_outlined,
                        icColor: Colors.blueAccent,
                      ),
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
                    margin: const EdgeInsets.only(bottom: 5, top: 3, left: 4, right: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey[400]),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    print('---- fromDateStr: ${formatDateForServer(fromDate)}');
                    print('---- toDateStr: ${formatDateForServer(toDate)}');
                    if (fromDateStr.isNotEmpty && toDateStr.isNotEmpty) {
                      showSnackBar(context, 'Loading data...');
                      setState(() {
                        apiBloc.fetchOrdersApi(formatDateForServer(fromDate), formatDateForServer(toDate));
                      });
                    } else
                      showSnackBar(context, 'Please select both dates!');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: apiBloc.ordersApi,
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
                      child: buildUi(snapshot.data.response));
                } else if (snapshot.hasError) {
                  return SomethingWrongScreen(onTap: () {});
                } else if (!snapshot.hasData) {
                  return TltProgressbar();
                } else
                  return NoDataFound(
                    txt: 'No data found',
                    onRefresh: () {
                      print('---- : onRefresh order');
                      fromDateStr = '';
                      toDateStr = '';
                      showSnackBar(context, 'Loading data...');
                      setState(() {
                        apiBloc.fetchOrdersApi('', '');
                      });
                    },
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    //print('----${offerList.length}');
    return SlideInUp(
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: ListView.builder(
            itemCount: _searchResult.length != 0 || controller.text.isNotEmpty ? _searchResult.length : response.length,
            itemBuilder: (BuildContext context, int index) {
              if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                return OrdersListWidget(
                  response: _searchResult,
                  index: index,
                  onTapOnList: null,
                  onRefreshed: () {
                    print('---- : onRefresh order');
                    fromDateStr = '';
                    toDateStr = '';
                    showSnackBar(context, 'Loading data...');
                    setState(() {
                      apiBloc.fetchOrdersApi('', '');
                    });
                  },
                );
              } else {
                listData = response;
                return OrdersListWidget(
                  response: listData,
                  index: index,
                  onTapOnList: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => OrderDetails(response: response, position: index),
                      ),
                    );
                  },
                  onRefreshed: () {
                    //print('---- : onRefresh order');
                    fromDateStr = '';
                    toDateStr = '';
                    showSnackBar(context, 'Loading data...');
                    setState(() {
                      apiBloc.fetchOrdersApi('', '');
                    });
                  },
                );
              }
            }),
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
      if (model.orderId.toLowerCase().contains(text.toLowerCase()) || model.customerName.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }

  void pickDateFromDatePicker() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      fromDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 0);
      DateTime picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          firstDate: DateTime.now().subtract(Duration(days: 15000)),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDate: fromDate,
          currentDate: fromDate,
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
      toDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 0);
      DateTime picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          firstDate: DateTime.now().subtract(Duration(days: 15000)),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDate: toDate,
          currentDate: toDate,
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
}
