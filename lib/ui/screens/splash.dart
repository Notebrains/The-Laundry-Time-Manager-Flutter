import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';
import 'package:tlt_manager/helper/extn_fun/base_app_fun.dart';
import 'package:tlt_manager/helper/shared_preference_data.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin fltNotification;

  @override
  void initState() {
    notificationPermission();
    initMessaging();
    super.initState();
    setScreenOrientationToLandscape();
    _loadWidget();

    //initUserInteractionOnNotification();
  }

  void getToken() async {
    print(await messaging.getToken());
  }


  _loadWidget() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    SharedPreferenceHelper().getUserSavedData().then((sharedPrefUserProfileModel) {
      String userId = sharedPrefUserProfileModel.userId ?? '';
      if(userId != ''){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LogIn()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent.withOpacity(0.6),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          /*Image.asset(
                'assets/images/bg-6.png',
                fit: BoxFit.cover,
              ),*/


          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                child: Center(
                  child: Image.asset(
                    'assets/images/manager_app_logo.png',
                    width: 70 * SizeConfig.imageSizeMultiplier,
                    height: 90 * SizeConfig.imageSizeMultiplier,
                    //color: Colors.white,
                  ),
                ),
              ),


              ZoomIn(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30,),
                  child: Text(
                    "THE LAUNDRY TIME",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black54),
                  ),
                ),
              )

            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: FadeIn(
                child: Container(
                  width: 250,
                  height: 16,
                  child: LinearProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.greenAccent[700]),
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.asset('assets/animations/lottiefiles/beer-bubbles.json', fit: BoxFit.fitWidth)),
        ],
      ),
    );
  }


  void initMessaging() async{
    var androidInit = AndroidInitializationSettings('ic_launcher');
    var iosInit = IOSInitializationSettings();
    var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'tlt_manager_channel_id', // id
      'The laundry time manager', // title
      'This notification is from  TLT Manager.', // description
      importance: Importance.max,
    );

    fltNotification = FlutterLocalNotificationsPlugin();
    await fltNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    fltNotification.initialize(initSetting);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      //Show local notification when app in foreground and message is received.
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        print('Message also contained a notification: ${message.notification}');
        fltNotification.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: android?.smallIcon,
                // other properties...
              ),
              iOS: IOSNotificationDetails(),
            ),
            payload: 'Product Details'
        );
      }
    });
  }

  void notificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
}
