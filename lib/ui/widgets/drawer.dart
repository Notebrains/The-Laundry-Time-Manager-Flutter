import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            drawerHeader(),
            drawerBodyItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.home_screen),
            ),
            drawerBodyItem(
              icon: Icons.shopping_bag,
              text: 'Orders',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.orders_screen),
            ),
            drawerBodyItem(
              icon: Icons.directions_car_sharp,
              text: 'Pick Up',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.pick_up_screen),
            ),
            drawerBodyItem(
              icon: Icons.local_car_wash_rounded,
              text: 'Drop Off',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.drop_off_screen),
            ),
            drawerBodyItem(
              icon: Icons.shop_rounded,
              text: 'Sales',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.sales_screen),
            ),
            drawerBodyItem(
              icon: Icons.shopping_basket_rounded,
              text: 'Products',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.product_screen),
            ),
            drawerBodyItem(
              icon: Icons.local_offer_rounded,
              text: 'Offers',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.offers_screen),
            ),
            drawerBodyItem(
              icon: Icons.rate_review_rounded,
              text: 'Reviews',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.review_screen),
            ),
            drawerBodyItem(
              icon: Icons.supervised_user_circle_rounded,
              text: 'Customers',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.customer_screen),
            ),

            drawerBodyItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: (){
                SharedPreferenceHelper().clearPrefData();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LogIn()));
              } ,
            ),
            /*
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'App version 1.0.0',
                style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.normal),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
