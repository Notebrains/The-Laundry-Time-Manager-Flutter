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

class Orders extends StatefulWidget {
  static const String routeName = '/orders';

  final String screenTitle;

  const Orders({Key key, this.screenTitle}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController controller = TextEditingController();
  String pickDate = '';

  @override
  void initState() {
    super.initState();
    //print('----pickup date: ${formatDateForServer(date)}');
  }

  @override
  Widget build(BuildContext context) {
    apiBloc.fetchOrdersApi('', '');
    return Scaffold(
      appBar: AppBarCommon(context, 'Orders'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
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
              child: buildUi(snapshot.data.response),
            );
          } else if (snapshot.hasError) {
            return SomethingWrongScreen(onTap: () {});
          } else if (!snapshot.hasData) {
            return TltProgressbar();
          } else
            return NoDataFound(txt: 'No service found');
        },
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    //print('----${offerList.length}');
    return Column(
      children: [
        SlideInDown(
          child: Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Card(
              elevation: 3,
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
                    padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey[400]),
                    ),
                    alignment: Alignment.center,
                    child: TxtIcRow(
                        txt: pickDate.isEmpty ? '  FROM DATE' : pickDate,
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
                    margin: const EdgeInsets.only(bottom: 5, top: 3, left: 4, right: 4),
                    padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey[400]),
                    ),
                    alignment: Alignment.center,
                    child: TxtIcRow(
                        txt: pickDate.isEmpty ? '  TO DATE' : pickDate,
                        txtColor: Colors.black54,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        icon: Icons.date_range_outlined,
                        icColor: Colors.blueAccent),
                  ),
                  onTap: () {
                    pickDateFromDatePicker();
                  },
                ),
              ),
              Container(
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
            ],
          ),
        ),
        Expanded(
          child: SlideInUp(
            child: OrdersListWidget(
              response: response,
              onTapOnList: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OrderDetails(response: response, position: index),
                  ),
                );
              },
              onTapOnBtn: (value) {},
              onTapOnItems: (index) {},
            ),
          ),
        ),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    /* _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listData.forEach((itemDetail) {
      if (itemDetail.itemName.toLowerCase().contains(text.toLowerCase())){
        _searchResult.add(itemDetail);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});*/
  }

  String pickDateFromDatePicker() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
      DateTime picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          firstDate: DateTime.now().subtract(Duration(days: 0)),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDate: date,
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
        if (picked != null && picked != date)
          setState(() {
            date = picked;
            pickDate = formatDateForUs(date);
          });
      }
    });

    return pickDate;
  }
}
