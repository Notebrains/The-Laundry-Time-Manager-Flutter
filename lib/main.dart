import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/screens/products.dart';
import 'package:tlt_manager/ui/screens/reviews.dart';
import 'package:tlt_manager/ui/screens/sales.dart';
import 'package:tlt_manager/ui/screens/splash.dart';
import 'helper/extn_fun/base_app_fun.dart';
import 'ui/exports/routes.dart';
import 'ui/exports/styles.dart';
//import 'package:device_preview/device_preview.dart';


//This function will call if app run on background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message-messageId: ${message.messageId}");
  print("Handling a background message-title: ${message.notification.title}");
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyRootApp());
  /*DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyRootApp(), // Wrap your app
    ), */
}


class MyRootApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setScreenOrientationToLandscape();
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              //locale: DevicePreview.of(context).locale, // Add the locale here
              //builder: DevicePreview.appBuilder, // Add the builder here
              routes:  {
                Routes.home_screen: (context) => Home(),
                Routes.offers_screen: (context) => Offers(),
                Routes.orders_screen: (context) => Orders(),
                Routes.pick_up_screen: (context) => PickUp(),
                Routes.drop_off_screen: (context) => DropOff(),
                Routes.review_screen: (context) => Review(),
                Routes.product_screen: (context) => Product(),
                Routes.sales_screen: (context) => Sale(),
                Routes.customer_screen: (context) => Customer(),
              },
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}

/*
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: AppTheme.lightTheme,
      home: Home(),
      routes:  {
        Routes.home_screen: (context) => Home(),
        Routes.offers_screen: (context) => Customer(),
        Routes.pick_up_screen: (context) => Offers(),
        Routes.drop_off_screen: (context) => DropOff(),
        Routes.orders_screen: (context) => Orders(),
      },
    );
  }
}
*/

