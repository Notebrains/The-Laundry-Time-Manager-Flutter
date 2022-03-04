import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/sales_res_model.dart';

class Sale extends StatefulWidget {
  static const String routeName = '/sale';

  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  TextEditingController controller = TextEditingController();
  List<Response> _searchResult = [];
  List<Response> listData = [];

  @override
  Widget build(BuildContext context) {
    apiBloc.fetchSalesApi();
    return Scaffold(
      appBar: AppBarCommon(context, 'Sales'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: apiBloc.salesApi,
        builder: (context, AsyncSnapshot<SalesResModel> snapshot) {
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
              child: snapshot.data.response.length > 0 ? buildUi(snapshot.data.response) : NoDataFound(txt: 'No data found', onRefresh: (){setState(() {});},),
            );
          } else if (!snapshot.hasData) {
            return TltProgressbar();
          } else return NoDataFound(txt: 'No data found', onRefresh: (){setState(() {});},);
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
                  decoration: InputDecoration(hintText: 'Search for order id, customer name...', border: InputBorder.none),
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
        Expanded(
          child: SlideInUp(
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),
              //color: Colors.white,
              child: ListView.builder(
                  itemCount: _searchResult.length != 0 || controller.text.isNotEmpty ? _searchResult.length : response.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                      return SalesListWidget(
                        response: _searchResult,
                        index: index,
                        onTapOnList: (){},
                        onRefresh: (){setState(() {});},
                      );
                    } else {
                      listData = response;
                      return SalesListWidget(
                        response: response,
                        index: index,
                        onTapOnList: (){},
                        onRefresh: (){setState(() {});},
                      );
                    }
                  }),
            ),
          ),
        ),
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
          model.paymentFor.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }
}
