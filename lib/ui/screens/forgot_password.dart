import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/sliding_entrances/slide_in_up.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/status_msg_res_model.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = '';
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarIcBack(context ,'Request Password'),

      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: Stack(
          children: [
            LottieBubbles(),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Text(
                        'Enter your registered email address',
                        style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                    preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1000)),
                  ),

                  SlideInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: BtnSqWhite(
                        txt: email,
                        hint: 'Email address',
                        isPassInvisible: false,
                        icon: Icons.email,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) {
                          email = value;
                        },
                        validator: validateEmail,
                      ),
                    ),
                    preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1100)),
                  ),

                  SlideInUp(
                    child: BtnBgBlue(
                      text: 'Send',
                      bgColors: AppTheme.topBarBackgroundColor,
                      onPressed: () {
                        _sendToServer();
                      },
                    ),
                    preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1200)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print(" Email $email ");
      fetchDataApi(context);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  void fetchDataApi(BuildContext context) async {
    apiBloc.fetchRequestPassApi(email);
    BuildContext dialogContext;
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        dialogContext = context;
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
                  stream: apiBloc.requestPassApi,
                  builder: (context, AsyncSnapshot<StatusMsgResModel> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.status == 1) {
                        return  IcTxtBtnColumn(txt: snapshot.data.message, txtColor: Colors.black87, txtSize: 18, btnTxt: 'Close',
                          icColor: Colors.green, icon: Icons.mark_email_unread,
                          onTap:  (){
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => LogIn(),
                                ),
                              ).then((value) => Navigator.pop(context));
                            });

                          },
                        );
                      } else
                        return IcTxtBtnColumn(txt: snapshot.data.message, txtColor: Colors.black87, txtSize: 18, btnTxt: 'Try Again',
                          icColor: Colors.red, icon: Icons.error,
                          onTap:  (){
                            Navigator.pop(context);
                          },
                        );
                    } else
                      return TltProgressbar();
                  }),
            ),
            preferences: AnimationPreferences(duration: const Duration(milliseconds: 800), autoPlay: AnimationPlayStates.Forward),
          ),
        );
      },
    );
  }
}
