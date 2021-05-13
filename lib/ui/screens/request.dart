import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/status_msg_res_model.dart';

class Request extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final String address;
  final String mobile;
  final String qty;
  final String requestType;
  final String orderId;

  const Request({Key key,  @required this.title,  @required this.date,  @required this.time,  @required this.address,
    @required this.mobile, @required this.qty,  @required this.requestType,  @required this.orderId}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _RequestState();
}

class _RequestState extends State<Request> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appBarIcBack(context, 'Accept/Decline ${widget.title}'),
      body: formUi(),
    );
  }

  Widget formUi() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(txt: 'New ${widget.title}', txtColor: Colors.green, txtSize: 24, fontWeight: FontWeight.bold, padding: 8, onTap: null),

            SlideInLeft(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.date_range_outlined,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.title,
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black54),
                          ),
                          TextSpan(
                            text: widget.date,
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: ' at ',
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black54),
                          ),
                          TextSpan(
                            text: widget.time,
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SlideInRight(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '${widget.title} ',
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black54),
                          ),
                          TextSpan(
                            text: widget.qty,
                            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SlideInRight(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TxtWithWidth(txt: widget.mobile, txtColor: Colors.black54, txtSize: 16, fontWeight: FontWeight.normal, width: 40 * SizeConfig.widthMultiplier,),
              ),
            ),

            SlideInRight(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TxtWithWidth(txt: widget.address, txtColor: Colors.black54, txtSize: 16, fontWeight: FontWeight.normal,width: 40 * SizeConfig.widthMultiplier,),
              ),
            ),


            SlideInRight(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    height: 35,
                    margin: const EdgeInsets.only(right: 12.0, top: 24, left: 16),
                    child: MaterialButton(
                      elevation: 0,
                      color: Color(0xFF32DE3C),
                      child: Text('ACCEPT',
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        acceptOrDeclineDialogByApi(context, widget.orderId, 'Accepted', '', onClose: (){
                          Navigator.pop(context, true);
                        });
                      },
                    ),
                  ),


                  Container(
                    alignment: Alignment.centerRight,
                    height: 35,
                    margin: const EdgeInsets.only(right: 12.0, left: 16, top: 24),
                    child: MaterialButton(
                      elevation: 0,
                      color: Color(0xFFFF8080),
                      onPressed: () {
                        showDeclineDialog(context, onClose: (reason){
                          acceptOrDeclineDialogByApi(context, widget.orderId, 'Rejected', reason, onClose: (){
                            Navigator.of(context, rootNavigator: true).pop();
                          });
                        });
                      },
                      child: Text('DECLINE',
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showDeclineDialog(BuildContext context, {Function(String reason) onClose}) async {
    String reason = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: ZoomIn(
            child: Container(
              width: 400,
              height: 310,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(txt: 'Reason please', txtColor: Colors.black54, txtSize: 16, fontWeight: FontWeight.bold, padding: 8, onTap: null),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 12),
                    child: Txt(txt: 'Mention your reason for declining your order', txtColor: Colors.grey, txtSize: 14, fontWeight: FontWeight.normal,
                        padding: 0, onTap: null),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    padding:  EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black38
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 310.0,
                      ),
                      child: TextFormField(
                        minLines: 8,
                        maxLines: 20,
                        initialValue: reason,
                        enabled: true,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        validator: validateEmptyString,
                        onChanged: (value){
                          reason = value;
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 8.0, top: 16, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          color: Color(0xFFFF8080),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('CLOSE',
                              style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: MaterialButton(
                            elevation: 0,
                            color: Color(0xFF32DE3C),
                            onPressed: () {
                              if (reason.isNotEmpty) {
                                Navigator.pop(context);
                                onClose(reason);
                              } else showToast(context, 'Please enter your reason');
                            },
                            child: Text('SEND',
                                style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            preferences: AnimationPreferences(duration: const Duration(milliseconds: 900), autoPlay: AnimationPlayStates.Forward),
          ),
        );
      },
    );
  }


  void acceptOrDeclineDialogByApi(BuildContext context, String orderId, String pickupStatus, String reason, {Function onClose}) async {
    //apiBloc.fetchUpdateOrderRequestApi(widget.requestType, orderId, widget.requestType == 'Pickup'? pickupStatus:'',
        //widget.requestType == 'Dropoff'? pickupStatus:'', reason);

    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: ZoomIn(
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: StreamBuilder(
                  //stream: apiBloc.acceptUpdateOrderRequestFetcherApi,
                  builder: (context, AsyncSnapshot<StatusMsgResModel> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.status == 1) {
                        return IcTxtBtnColumn(
                          txt: snapshot.data.message,
                          txtColor: Colors.black87,
                          txtSize: 18,
                          btnTxt: 'Done',
                          icColor: Colors.green,
                          icon: Icons.check_circle_outline,
                          onTap: () {
                            Navigator.pop(context);
                            onClose();
                          },
                        );
                      } else
                        return IcTxtBtnColumn(
                          txt: snapshot.data.message,
                          txtColor: Colors.black87,
                          txtSize: 18,
                          btnTxt: 'Try again',
                          icColor: Colors.red,
                          icon: Icons.warning,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        );
                    } else if (!snapshot.hasData) {
                      return TltProgressbar();
                    } else
                      return NoDataFound();
                  }),
            ),
            preferences: AnimationPreferences(duration: const Duration(milliseconds: 1200), autoPlay: AnimationPlayStates.Forward),
          ),
        );
      },
    );
  }
}
