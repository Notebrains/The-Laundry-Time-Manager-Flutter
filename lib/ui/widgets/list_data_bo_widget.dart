import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/bulk_pick_up_res_model.dart';

class ListDataBulkWidget extends StatelessWidget {
  final Response response;
  final String bulkOrderRecvType;
  final String tabName;
  final Function (int index) onTapOnBtn;
  final Function (int index) onTapOnItems;
  final Function onTapOnList;

  ListDataBulkWidget({
    Key key,
    @required this.response,
    @required this.bulkOrderRecvType,
    @required this.tabName,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final dataList = [];
    if (tabName == 'current') {
      dataList.addAll(response.current);
    } else if (tabName == 'pending') {
      dataList.addAll(response.pending);
    } else if (tabName == 'past') {
      dataList.addAll(response.history);
    }
    //print('-----dataList: ${response.pending.length}');

    if (dataList.length > 0) {
      return Container(
        margin: EdgeInsets.only(top: 12, bottom: 12),
        color: Colors.white,
        child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(txt: 'Order ID - ${dataList[index].orderId}', txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.bold,
                                  padding: 3, onTap: null),

                              TxtIcRow(txt: '$bulkOrderRecvType ${dataList[index].pickupTime}', txtColor: Colors.black54, txtSize: 12, fontWeight: FontWeight.normal,
                              ),

                              TxtIcRow(txt:'${dataList[index].street}, ${dataList[index].city}, zip code-${dataList[index].zipCode}, ${dataList[index].country}', txtColor: Colors.black54, txtSize: 12, fontWeight: FontWeight.normal,
                                  )
                            ],
                          ),

                          onTap: onTapOnList,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Txt(txt: 'Sub total- \$${dataList[index].totalPayable}', txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.bold,
                                padding: 5, onTap: null),

                            InkWell(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: SvgPicture.asset(
                                      'assets/icons/svg/cart.svg',
                                      height: 15,
                                      width: 15,
                                      color: Colors.black54,
                                    ),
                                  ),

                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: tabName == 'past'? 'Act. weight - ': 'Est. weight - ',
                                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text: "${dataList[index].estimateWeight} lb",
                                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              onTap: (){
                                onTapOnItems(index);
                              },
                            ),


                            Visibility(
                              visible: tabName != 'past',
                              child: Container(
                                height: 28,
                                margin: const EdgeInsets.only(bottom: 8, top: 5),
                                child: MaterialButton(
                                  elevation: 0,
                                  color: Color(0xFF32DE3C).withOpacity(.9),
                                  onPressed: (){
                                    onTapOnBtn(index);
                                  },
                                  child: Text(
                                      tabName != 'pending'? 'TRACK': 'ACCEPT/DECLINE',
                                      style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            }
        ),
      );
    } else {
      return NoDataFound(txt: 'No data found');
    }

  }
}