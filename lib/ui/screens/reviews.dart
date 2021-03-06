import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/extn_fun/check_network_connection.dart';
import 'package:tlt_manager/helper/extn_fun/common_fun.dart';
import 'package:tlt_manager/helper/libraries/star_rating.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/reviews_res_model.dart';

class Review extends StatelessWidget {
  static const String routeName = '/review';

  @override
  Widget build(BuildContext context) {
    apiBloc.fetchReviewApi();
    return new Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBarCommon(context, 'Reviews'),
      drawer: NavigationDrawer(),
      body: StreamBuilder(
        stream: apiBloc.reviewApi,
        builder: (context, AsyncSnapshot<ReviewsResModel> snapshot) {
          /*bool isInternetConnectionAvailable = true;
          NetworkCheck().checkInternet( func: (isConnectionAvailable){
            print('---- isInternetConnectionAvailable: $isInternetConnectionAvailable');
            //isConnectionAvailable? isInternetConnectionAvailable = true : isInternetConnectionAvailable = false;

            if (isConnectionAvailable) {
              return Container(
                color: Colors.green,
              );
            } else return Container(
              color: Colors.green,
            );
          }
          );*/

          if (snapshot.hasData && snapshot.data.status == 1 && snapshot.data.message == 'Success') {
            return buildUi(snapshot.data.response);
          } /*else if (!isInternetConnectionAvailable) {
            return NoInternetConnection(onTap: (){

            },);
          }*/
          else if (snapshot.hasError) {
            return SomethingWrongScreen(onTap: () {});
          } else if (!snapshot.hasData) {
            return TltProgressbar();
          } else
            return  NoDataFound(txt: 'No data found', onRefresh: (){
              Navigator.pushReplacementNamed(context, Routes.review_screen);
            },);
        },
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    return Column(
      children: [
        /*FadeInDown(
          child: Container(
            height: 125,
            width: double.maxFinite,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey[300]),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BounceInDown(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      '4.0',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 30, color: Colors.black54),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 8),
                  child: StarRating(
                    rating: 4.5,
                    color: Colors.amber,
                    iconSize: 25,
                  ),
                ),

                Text(
                  'Based on 20 reviews',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),*/

        Expanded(
          child: FadeInUpBig(
            child: Container(
              margin: EdgeInsets.only(bottom: 12, top: 8),
              //color: Colors.white,
              child: ListView.builder(
                  itemCount: response.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey[300]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5, bottom: 3),
                                child: cachedNetImgWithRadius(Strings.imgUrlNotFoundYellowAvatar, 5.5 * SizeConfig.heightMultiplier,
                                    5.5 * SizeConfig.heightMultiplier, 25),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(6, 5, 5, 0),
                                    child: Text(
                                      response[index].customerName,
                                      style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black87, letterSpacing: 0.5),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(5, 3, 8, 0),
                                        child: StarRating(
                                          rating: 4.0,
                                          color: Colors.amber,
                                          iconSize: 20,
                                        ),
                                      ),

                                      Text(
                                        response[index].rating,
                                        style: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 3),
                            child: Text(
                              response[index].review,
                              style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' Order Id:${response[index].orderId}',
                                style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
                              ),

                              Text(
                                response[index].reviewDate,
                                style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
