import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Sale extends StatefulWidget {
  static const String routeName = '/sale';

  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  TextEditingController controller = TextEditingController();String pickDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(context, 'Sales'),
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
                  decoration: InputDecoration(hintText: 'Search for order id...', border: InputBorder.none),
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
            child: SalesListWidget(
              onTapOnList: () {
                //Navigator.pushNamed(context, Routes.order_details_screen);
              },
              onTapOnBtn: (value) {},
              onTapOnItems: (index) {
                showBottomSheetUi();
              },
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

  showBottomSheetUi() {
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
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return 5 > 0
                              ? ExpansionTile(
                                  title: ExpandedListWidget(
                                    name: 'Item Name',
                                    categoryName: '',
                                    price: '',
                                    qty: '2',
                                    image: Strings.imgUrlFirebaseBulkOrder,
                                  ),
                                  children: List<Widget>.generate(
                                    2,
                                    (i) => ExpandedListWidget(
                                      name: 'Item Name',
                                      categoryName: '',
                                      price: '200',
                                      qty: '2',
                                      image: Strings.imgUrlFirebaseBulkOrder,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 50),
                                  child: ExpandedListWidget(
                                    name: 'Item Name',
                                    categoryName: '',
                                    price: '100',
                                    qty: '2',
                                    image: Strings.imgUrlFirebaseBulkOrder,
                                  ),
                                );
                        }),
                  ),
                  TxtTxtTxtRow(
                    text1: 'TOTAL',
                    text2: '05',
                    text3: '\$100.00',
                    text1Color: Colors.black87,
                    text2Color: Colors.black87,
                    bgColor: Colors.lightBlueAccent.withOpacity(0.3),
                  ),
                ],
              ),
            );
          });
        });
  }
}
