import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/shared_preference_data.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/login_res_model.dart';

class Settings extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;

  const Settings({Key key, this.name, this.email, this.mobile}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<Settings> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String oldPass = '', newPass = '', confirmPass = '';
  String customerId = '';
  bool isChangePassVisible = false;
  bool isContactVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appBarIcBack(context, 'Settings'),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: formUi(),
      ),
    );
  }

  Widget formUi() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(Icons.perm_identity_rounded,  size: 26, color: Colors.grey,)),

                      Expanded(
                        flex: 2,
                        child: Text(
                          'Driver Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.grey),
                        ),
                      ),

                      Expanded(
                        flex: 4,
                        child: Text(
                          widget.name??'',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),

                onTap: (){

                }
            ),

           /* BtnIcTxtIcBgWhite(text: 'Change Password', icon1: Icons.lock_outline_rounded,
              icon2: !isChangePassVisible? Icons.arrow_forward_ios_rounded : Icons.keyboard_arrow_down_rounded,
              textSize: 16, onPressed: (){
              setState(() {
                isChangePassVisible? isChangePassVisible = false : isChangePassVisible = true;
              });
            },),


            Visibility(
              visible: isChangePassVisible,
              child: SlideInRight(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: BtnSqWhite(
                    txt: oldPass,
                    hint: 'Enter old password',
                    isPassInvisible: true,
                    icon: Icons.lock_outline_rounded,
                    textInputType: TextInputType.visiblePassword,
                    onSaved: (value) {
                      oldPass = value;
                    },
                    validator: isChangePassVisible ? validatePass : null,
                  ),
                ),
                preferences:
                AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1000)),
              ),
            ),

            Visibility(
              visible: isChangePassVisible,
              child: SlideInLeft(
                child: BtnSqWhite(
                  txt: newPass,
                  hint: 'Enter new password',
                  isPassInvisible: true,
                  icon: Icons.lock_outline_rounded,
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (value) {
                    newPass = value;
                  },
                  validator: isChangePassVisible ? validatePass : null,
                ),
                preferences:
                AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1000)),
              ),
            ),
            
            Visibility(
              visible: isChangePassVisible,
              child: SlideInRight(
                child: BtnSqWhite(
                  txt: confirmPass,
                  hint: 'Enter confirm password',
                  isPassInvisible: true,
                  icon: Icons.lock_outline_rounded,
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (value) {
                    confirmPass = value;
                  },
                  validator: isChangePassVisible ? validatePass : null,
                ),
                preferences:
                AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 1000)),
              ),
            ),


            Visibility(
              visible: isChangePassVisible,
              child: SlideInRight(
                child: Container(
                  alignment: Alignment.centerRight,
                  height: 35,
                  margin: const EdgeInsets.only(right: 12.0, bottom: 50, top: 5),
                  child: MaterialButton(
                    elevation: 0,
                    color:Color(0xFF32DE3C),
                    onPressed: (){
                      //onTapOnTrack();
                    },
                    child: Text(
                        'SUBMIT',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),*/

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: BtnIcTxtIcBgWhite(text: 'Contact Us', icon1: Icons.perm_contact_calendar_outlined,
                icon2: !isContactVisible? Icons.arrow_forward_ios_rounded : Icons.keyboard_arrow_down_rounded,
                textSize: 16, onPressed: (){
                  setState(() {
                    isContactVisible? isContactVisible = false : isContactVisible = true;
                  });
              },),
            ),

            Visibility(
              visible: isContactVisible && widget.mobile.isNotEmpty,
              child: SlideInLeft(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
                  child: TxtIcRow(txt: widget.mobile??'', txtColor: Colors.blue, txtSize: 14, fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),

            Visibility(
              visible: isContactVisible,
              child: SlideInRight(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
                  child: TxtIcRow(txt: widget.email??'', txtColor: Colors.blue, txtSize: 14, fontWeight: FontWeight.normal,
                      ),
                ),
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
      changePassByApi(context);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }


  void changePassByApi(BuildContext context) async {
    apiBloc.fetchLoginApi(widget.email, 'widget.password',);

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
