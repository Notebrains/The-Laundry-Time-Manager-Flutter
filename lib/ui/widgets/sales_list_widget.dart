import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/attention_seekers/pulse.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SalesListWidget extends StatelessWidget {
  final Function onTapOnList;
  final Function(int index) onTapOnBtn;
  final Function(int index) onTapOnItems;

  SalesListWidget({
    Key key,
    @required this.onTapOnList,
    @required this.onTapOnBtn,
    @required this.onTapOnItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = [];
    if (dataList.isEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        //color: Colors.white,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
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
                              txt: 'ORDER ID - TLT003562',
                              txtColor: Colors.black54,
                              txtSize: 14,
                              fontWeight: FontWeight.bold,
                              padding: 3,
                              onTap: null,
                          ),
                          TxtWithWidth(
                            txt: '4th Jan, 2021',
                            txtColor: Colors.black54,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            width: 45 * SizeConfig.widthMultiplier,
                          ),
                          TxtWithWidth(
                            txt: 'Premium order',
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
                          txt: 'Cash on delivery',
                          txtColor: Colors.blueGrey,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          width: 40 * SizeConfig.widthMultiplier,
                        ),

                        Txt(
                          txt: 'Amount \$70.00',
                          txtColor: Colors.black54,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                          onTap: null,
                        ),
                        Container(
                          height: 25,
                          margin: const EdgeInsets.only(bottom: 8, top: 5),
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Completed',
                            style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      );
    } else {
      return NoDataFound(txt: 'No data found');
    }
  }

  _launchCaller(String contactNo) async {
    final url = "tel:$contactNo";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
