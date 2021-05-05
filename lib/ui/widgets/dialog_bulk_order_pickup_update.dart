import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/avatar_glow.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/status_msg_res_model.dart';

void showBulkOrderPickUpUpdateDialog(context, {Function onClose}) async {
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
                      child: Txt(txt: 'Update Weight', txtColor: Colors.black87, txtSize: 18, fontWeight: FontWeight.bold, padding: 8, onTap: null),
                    ),

                    StreamBuilder(
                        stream: apiBloc.updateBulkWeightApi,
                        builder: (context, AsyncSnapshot<StatusMsgResModel> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.status == 1) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AvatarGlow(
                                      glowColor: Colors.green,
                                      child: Icon(Icons.check_circle,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      endRadius: 60),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data.message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),),
                                      onPressed: () {
                                        onClose();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close', style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ],
                              );
                            } else return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AvatarGlow(
                                    glowColor: Colors.redAccent,
                                    child: Icon(Icons.warning,
                                      color: Colors.redAccent,
                                      size: 30,
                                    ),
                                    endRadius: 60),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data.message,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),),
                                    onPressed: () {
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