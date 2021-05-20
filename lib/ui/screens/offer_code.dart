import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';

class OfferCode extends StatefulWidget {
  final List<Vouchers_list> dataList;
  OfferCode({Key key, this.dataList}) : super(key: key);

  @override
  _OfferCodeState createState() {
    return _OfferCodeState();
  }
}

class _OfferCodeState extends State<OfferCode> {
  TextEditingController controller = TextEditingController();
  List<Vouchers_list> _searchResult = [];
  List<Vouchers_list> listData = [];
  int itemQty = 0;
  int bottomRadioValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    decoration: InputDecoration(hintText: 'Code, validity, status...', border: InputBorder.none),
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
                    return buildListContent(_searchResult, index);
                  } else {
                    listData = widget.dataList;
                    return buildListContent(listData, index);
                  }

                },
              ),
            ),
          ],
        ),
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
      if (model.code.toLowerCase().contains(text.toLowerCase()) ||
          model.validTo.toLowerCase().contains(text.toLowerCase()) ||
          model.status.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }

  Widget buildListContent(List<Vouchers_list> listData, int index) {
    return SlideInRight(
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.05),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.grey[50]),
            ),
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            padding: EdgeInsets.only(bottom: 8, top: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.0 * SizeConfig.widthMultiplier,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Voucher Code: ${listData[index].code}',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 4,
                          top: 2,
                        ),
                        child: Text(
                          'Minimum billable \$${listData[index].cutoffAmount}',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 13, color: Colors.grey[600]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 4,
                          top: 2,
                        ),
                        child: Text(
                          'Valid till  ${listData[index].validTo}',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 13, color: Colors.grey[600]),
                        ),
                      ),


                      Text(
                        'Status: ${listData[index].status}',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),

                      InkWell(
                        child: Container(
                          height: 25,
                          width: 90,
                          margin: const EdgeInsets.fromLTRB(0, 8, 8, 5),
                          padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                          decoration: BoxDecoration(
                            //color: Colors.grey[200],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          alignment: Alignment.center,
                          child: Text('No. of user',
                            style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
                          ),
                        ),

                        onTap: (){
                          if (listData[index].customerDetails.isNotEmpty) {
                            showBottomSheetUi(listData[index].customerDetails);
                          } showSnackBar(context, 'No one used this voucher code');
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text( listData[index].discountType == 'Percentage Discount' ? '${listData[index].discountAmount} %\nOFF'
                            : '\$${convertStrToDoubleStr(listData[index].discountAmount)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
        ),

      ),
    );
  }


  showBottomSheetUi(List<Customer_details> customerDetails) {
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
                                      'Date - ${customerDetails[index].date}',
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
                                      customerDetails[index].mobile,
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
        });
  }

}
