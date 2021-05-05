import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class Orders extends StatefulWidget {
  static const String routeName = '/orders';

  @override
  _OrdersState createState() =>  _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController controller =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(context, 'Orders'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: LiquidPullToRefresh(
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        onRefresh: (){
          return Future.delayed(
            Duration(milliseconds: 700), () {
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
        Container(
          height: 60,
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child:  Card(
            elevation: 3,
            child:  ListTile(
              leading:  Icon(Icons.search),
              title:  TextField(
                controller: controller,
                decoration:  InputDecoration(
                    hintText: 'Search order id, customer name...', border: InputBorder.none),
                onChanged: onSearchTextChanged,
              ),
              trailing: Visibility(
                visible: controller.text.isNotEmpty,
                child: IconButton(icon: Icon(Icons.cancel_outlined), onPressed: () {
                  controller.clear();
                  onSearchTextChanged('');
                },),
              ),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                margin: const EdgeInsets.only(bottom: 5, top: 8, left: 16, right: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey[400])),
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  hint: Text("Order Id"),
                  items: <String>['TLT0014535', 'TLT0014535', 'TLT0014535', 'TLT0014535'].map((String value) {
                    return  DropdownMenuItem<String>(
                      value: value,
                      child:  Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                margin: const EdgeInsets.only(bottom: 5, top: 8, left: 4, right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey[400])),
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  hint: Text("Customer Name"),
                  items: <String>['Raj Mondal', 'Shovon Mondal', 'Alamgir', 'Tapon Basuli'].map((String value) {
                    return  DropdownMenuItem<String>(
                      value: value,
                      child:  Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              flex: 1,
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 5, top: 5, left: 16, right: 4),
                padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey[400]),
                ),
                alignment: Alignment.center,
                child: Text('FROM DATE',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
                ),
              ),
            ),


            Expanded(
              flex: 1,
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 5, top: 5, left: 4, right: 16),
                padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey[400]),
                ),
                alignment: Alignment.center,
                child: Text('TO DATE',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),

        Expanded(
          child: ListDataWidgetPremiumPickUp(
            onTapOnList: () {},
            onTapOnBtn: (value) {},
            onTapOnItems: (index) {
              showBottomSheetUi();
            },
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
                                title: BottomSheetItemDetailsUi(
                                  name: 'itemName',
                                  categoryName: '',
                                  price: '',
                                  qty: 'itemQty',
                                  image: Strings.imgUrlFirebaseBulkOrder,
                                ),

                            children: List<Widget>.generate(
                              2, (i) => BottomSheetItemDetailsUi(
                                name: 'itemName',
                                categoryName: '',
                                price: '',
                                qty: 'itemQty',
                                image: Strings.imgUrlFirebaseBulkOrder,
                              ),
                            ),
                          )
                              : Padding(
                                padding: const EdgeInsets.only(left: 16, right: 50),
                                  child: BottomSheetItemDetailsUi(
                                    name: 'itemName',
                                    categoryName: '',
                                    price: '',
                                    qty: 'itemQty',
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
                      text2Color: Colors.black87),
                ],
              ),
            );
          });
        });
  }
}
