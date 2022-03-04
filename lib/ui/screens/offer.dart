import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';

class OffersZone extends StatefulWidget {
  static const String routeName = '/offers';

  @override
  _OffersZoneState createState() => _OffersZoneState();
}

class _OffersZoneState extends State<OffersZone> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();

    apiBloc.fetchOffersApi();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {
        _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  TabBar get _tabBar => TabBar(
    indicatorWeight: 3,
    labelColor: Colors.white,
    unselectedLabelColor: Colors.black,
    labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 15, color: Colors.white),
    indicator: BoxDecoration(
      //borderRadius: BorderRadius.circular(0), // Creates border
        color: AppTheme.selectedTabBackgroundColor),
    controller: _controller,
    tabs: [
      Tab(text: 'BEST DEALS',),
      Tab(text: 'VOUCHER CODE',),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: AppTheme.selectedTabBackgroundColor),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Container(
                color: AppTheme.selectedTabBackgroundColor.withOpacity(0.3),
                margin: EdgeInsets.only(left: 16, right: 16),
                child: _tabBar),
          ),
          title: Text('Offers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),),
        ),
        drawer: NavigationDrawer(),
        body: StreamBuilder(
          stream: apiBloc.offerApi,
          builder: (context, AsyncSnapshot<OffersResModel> snapshot) {
            if (snapshot.hasData && snapshot.data.status == 1  && snapshot.data.message != "No data found") {
              return TabBarView(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                children: [
                  BestOffers(dataList: snapshot.data.response.offersList,),
                  OfferCode(dataList: snapshot.data.response.vouchersList),
                ],
              );

            } else if (snapshot.hasError) {
              return SomethingWrongScreen(onTap: () {
                //setState(() {});
              },);
            } else if (!snapshot.hasData) {
              return TltProgressbar();
            } else
              return NoDataFound(txt: 'No data found', onRefresh: null,);
          },
        )
    );
  }
}
