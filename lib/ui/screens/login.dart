import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/shared_preference_data.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/login_res_model.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: formUi(),
      ),
    );
  }

  Widget formUi() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 100, left: 30),
            child: Image.asset('assets/images/manager_app_logo.png', width: 200, height: 200,),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 26),
            child: Text( 'SIGN IN',
              style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.lightBlue[900]),
            ),
          ),

          SlideInUp(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: BtnSqWhite(
                txt: email,
                hint: 'Email Address',
                isPassInvisible: false,
                icon: Icons.email_outlined,
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value;
                },
                validator: validateEmail,
              ),
            ),
            preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 800)),
          ),

          SlideInUp(
            child: BtnSqWhite(
              txt: password,
              hint: 'Password',
              isPassInvisible: true,
              icon: Icons.lock_outline_rounded,
              textInputType: TextInputType.visiblePassword,
              onSaved: (value) {
                password = value;
              },
              validator: validatePass,
            ),
            preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 900)),
          ),

          /*Align(
            alignment: Alignment.centerRight,
            child: SlideInUp(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 30, bottom: 8),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Forgot password?',
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey[800]),
                        ),
                        TextSpan(
                          text: " Request",
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
                },
              ),
              preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1000)),
            ),
          ),*/
          SlideInUp(
            child: BtnBgBlue(
                text: "SIGN IN",
                bgColors: AppTheme.topBarBackgroundColor,
                onPressed: _sendToServer
            ),
            preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1100)),
          ),
        ],
      ),
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("password $password , Email $email");
      loginByApi(context);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }


  void loginByApi(BuildContext context) async {
    apiBloc.fetchLoginApi(email, password,);

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
                  stream: apiBloc.loginRes,
                  builder: (context, AsyncSnapshot<LoginResModel> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.status == 1) {
                        SharedPreferenceHelper().saveUserData(
                            snapshot.data.response.id,
                            snapshot.data.response.name,
                            snapshot.data.response.email,
                            snapshot.data.response.mobile,
                        );

                        SharedPreferenceHelper().getUserCustomerId().then((id) => {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Home()));
                          })
                        });

                        return Container();
                      } else return IcTxtBtnColumn(txt: snapshot.data.message, txtColor: Colors.black87, txtSize: 18, btnTxt: 'OK',
                        icColor: Colors.red, icon: Icons.error,
                        onTap:  (){
                          Navigator.pop(context);
                        },
                      );
                    } else if (!snapshot.hasData) {
                      return  TltProgressbar();
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
