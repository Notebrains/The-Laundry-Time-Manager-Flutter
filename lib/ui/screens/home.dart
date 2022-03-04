import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/models/home_category_model.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class Home extends StatefulWidget {

  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeCategoryModel> categoryList = [];
  String name = '';
  String email = '';
  String userId = '';


  @override
  void initState() {
    super.initState();

    getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    addDataInModel();

    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Are you sure?', style: TextStyle(fontSize: 18),),
          content: Text('Do you really want to Quit?'),
          actions: [
            TextButton(
              child: Text('YES', style: TextStyle(fontSize: 14),),
              onPressed: () => Navigator.pop(c, true),
            ),
            TextButton(
              child: Text('NO', style: TextStyle(fontSize: 14),),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: Scaffold(
        drawer: NavigationDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              title: Txt(txt: '', txtColor: Colors.blueGrey, txtSize: 20, fontWeight: FontWeight.bold, padding: 0, onTap: null),
              centerTitle: false,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: AppTheme.selectedTabBackgroundColor),
              //backgroundColor: Colors.transparent,
              actions: <Widget>[
                //IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                //IconButton(icon: Icon(Icons.share), onPressed: () {})
              ],
              floating: true,
              pinned: false,
              expandedHeight: 180,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text("HOME"),
                // Adding padding from TabBar
                //titlePadding: EdgeInsets.only(bottom: 16, left: 60),
                background: Container(
                  height: 220,
                  padding: EdgeInsets.only(top: 60),
                  decoration: new BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(60, 60),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SlideInLeft(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(txt: name.toUpperCase(), txtColor: Colors.blueGrey, txtSize: 22, fontWeight: FontWeight.normal, padding: 0, onTap: null),

                            Container(
                              padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                              decoration: new BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.8),
                                borderRadius: BorderRadius.all(Radius.circular(3)),
                              ),
                              child: Txt(txt: 'Manager', txtColor: Colors.white, txtSize: 14, fontWeight: FontWeight.normal, padding: 0, onTap: null),
                            ),

                            TxtIcRow(txt: email, txtColor: Colors.blueGrey, txtSize: 14, fontWeight: FontWeight.normal,
                            icon: Icons.mail_rounded, icColor: Colors.blueGrey.withOpacity(0.8),),
                          ],
                        ),
                      ),

                      SlideInRight(child: Image.asset('assets/images/manager_app_logo.png', width: 75, height: 75,)),
                    ],
                  ),
                ),
              ),
            ),
            // Next, create a SliverList
            SliverPadding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisExtent: 180,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return InkWell(
                      child: SlideInUp(
                        child: Card(
                          elevation: 0,
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.1),
                          shadowColor: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedIcon(size: 45, elevation: 5, icon: categoryList[index].icon,
                                  bgColors: Colors.white,
                                  icColors: AppTheme.selectedTabBackgroundColor, onPressed: null),
                              Padding(
                                padding: const EdgeInsets.only(top: 18, bottom: 5),
                                child: Txt(txt: categoryList[index].category, txtColor: AppTheme.topBarBackgroundColor, txtSize: 16, fontWeight: FontWeight.normal, padding: 0, onTap: null),
                              ),

                             /*
                             Txt(txt: categoryList[index].count, txtColor: AppTheme.topBarBackgroundColor, txtSize: 16, fontWeight: FontWeight.normal, padding: 0, onTap: null),
                             */
                              SizedBox(
                                width: 60,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      onTap: (){
                        openPage(context, categoryList[index].category);
                      },
                    );
                  },
                  childCount: categoryList.length,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  void addDataInModel() async {
    categoryList.clear();
    categoryList.add(HomeCategoryModel(category: 'Orders', icon: Icons.shopping_bag, count: '01'));
    categoryList.add(HomeCategoryModel(category: 'Pick Up', icon: Icons.directions_car_sharp, count: '02'));
    categoryList.add(HomeCategoryModel(category: 'Drop Off', icon: Icons.local_car_wash_rounded, count: '03'));
    categoryList.add(HomeCategoryModel(category: 'Sales', icon: Icons.shop_rounded, count: '04'));
    categoryList.add(HomeCategoryModel(category: 'Products', icon: Icons.shopping_basket_rounded, count: '05'));
    categoryList.add(HomeCategoryModel(category: 'Offers', icon: Icons.local_offer_rounded, count: '06'));
    categoryList.add(HomeCategoryModel(category: 'Reviews', icon: Icons.rate_review_rounded, count: '07'));
    categoryList.add(HomeCategoryModel(category: 'Customers', icon: Icons.supervised_user_circle_rounded, count: '08'));
  }

  void openPage(BuildContext context, String category) {
    switch(category){
      case 'Orders':
        Navigator.pushReplacementNamed(context, Routes.orders_screen);
        break;
      case 'Pick Up':
        Navigator.pushReplacementNamed(context, Routes.pick_up_screen);
        break;
      case 'Drop Off':
        Navigator.pushReplacementNamed(context, Routes.drop_off_screen);
        break;
      case 'Sales':
        Navigator.pushReplacementNamed(context, Routes.sales_screen);
        break;
      case 'Products':
        Navigator.pushReplacementNamed(context, Routes.product_screen);
        break;
      case 'Offers':
        Navigator.pushReplacementNamed(context, Routes.offers_screen);
        break;
      case 'Reviews':
        Navigator.pushReplacementNamed(context, Routes.review_screen);
        break;
      case 'Customers':
        Navigator.pushReplacementNamed(context, Routes.customer_screen);
        break;
    }
  }

  void getLocalData() async {
    await SharedPreferenceHelper().getUserSavedData().then((sharedPrefUserProfileModel) async {
      userId = sharedPrefUserProfileModel.userId ?? '';
      name = sharedPrefUserProfileModel.userName ?? '';
      email = sharedPrefUserProfileModel.userEmail ?? '';

      String deviceToken = await FirebaseMessaging.instance.getToken();
      apiBloc.fetchUpdateDeviceTokenApi(userId, deviceToken);

      setState(() {

      });
    });
  }
}
