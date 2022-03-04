import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/sales_res_model.dart';

class SalesListWidget extends StatelessWidget {
  final List<Response> response;
  final int index;
  final Function onTapOnList;
  final Function onRefresh;

  SalesListWidget({
    Key key,
    @required this.response,
    @required this.index,
    @required this.onTapOnList,
    @required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.fromLTRB(12, 16, 10, 16),
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey[300]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    txt: 'ORDER ID - ${response[index].orderId}',
                    txtColor: Colors.blueGrey,
                    txtSize: 14,
                    fontWeight: FontWeight.bold,
                    padding: 3,
                    onTap: null,
                  ),
                  TxtWithWidth(
                    txt: response[index].transactionDate,
                    txtColor: Colors.black54,
                    txtSize: 14,
                    fontWeight: FontWeight.normal,
                    width: 45 * SizeConfig.widthMultiplier,
                  ),
                  TxtWithWidth(
                    txt: response[index].customerName,
                    txtColor: Colors.black54,
                    txtSize: 14,
                    fontWeight: FontWeight.normal,
                    width: 45 * SizeConfig.widthMultiplier,
                  ),
                  TxtWithWidth(
                    txt: response[index].paymentFor,
                    txtColor: Colors.blueAccent,
                    txtSize: 14,
                    fontWeight: FontWeight.normal,
                    width: 45 * SizeConfig.widthMultiplier,
                  ),
                ],
              ),
              onTap: onTapOnList,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TxtWithWidth(
                  txt: response[index].paymentMode,
                  txtColor: Colors.blueGrey,
                  txtSize: 14,
                  fontWeight: FontWeight.bold,
                  width: 40 * SizeConfig.widthMultiplier,
                ),

                Txt(
                  txt: 'Amount \$${response[index].transactionAmount}',
                  txtColor: Colors.black54,
                  txtSize: 14,
                  fontWeight: FontWeight.normal,
                  padding: 3,
                  onTap: null,
                ),
                Container(
                  height: 25,
                  width: 150,
                  margin: const EdgeInsets.only(bottom: 8, top: 5),
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Transaction ${response[index].transactionStatus}',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return NoDataFound(txt: 'No data found', onRefresh: onRefresh,);
    }
  }
}
