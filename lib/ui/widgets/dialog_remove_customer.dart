import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/avatar_glow.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/status_msg_res_model.dart';

void showRemoveCustomerDialog(context, {Function onClose}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    useSafeArea: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ZoomIn(
              child: Container(
                height: 450,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Txt(txt: 'Delete Customer', txtColor: Colors.black87, txtSize: 18, fontWeight: FontWeight.bold, padding: 8, onTap: null),
                    ),

                    StreamBuilder(
                        stream: apiBloc.deleteCustomerApi,
                        builder: (context, AsyncSnapshot<StatusMsgResModel> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.status == 1) {
                              return Column(
                                children: [
                                  AvatarGlow(
                                      glowColor: Colors.green,
                                      child: Icon(Icons.check_circle,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                      endRadius: 60),

                                  Txt(txt: snapshot.data.message, txtColor: Colors.black87, txtSize: 16, fontWeight: FontWeight.normal, padding: 12, onTap: null),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),),
                                      onPressed: () {
                                        onClose();
                                        Navigator.of(context);
                                      },
                                      child: Text('Close', style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ],
                              );
                            } else return Column(
                              children: [
                                AvatarGlow(
                                    glowColor: Colors.redAccent,
                                    child: Icon(Icons.warning,
                                      color: Colors.redAccent,
                                      size: 30,
                                    ),
                                    endRadius: 60),

                                Txt(txt: snapshot.data.message, txtColor: Colors.black87, txtSize: 14, fontWeight: FontWeight.bold, padding: 16, onTap: null),

                                Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),),
                                    onPressed: () {
                                      //onClose();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Close', style: TextStyle(fontSize: 14),),
                                  ),
                                ),
                              ],
                            );
                          }
                          return TltProgressbar();
                        }),

                  ],
                ),
              ),
              preferences: AnimationPreferences(autoPlay: AnimationPlayStates.Forward, duration: Duration(milliseconds: 700)),
            );
          },
        ),
      );
    },
  );
}