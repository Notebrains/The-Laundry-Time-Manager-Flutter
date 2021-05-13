import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/helper/libraries/star_rating.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/screens.dart';
import 'package:tlt_manager/ui/exports/styles.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/customer_list_res_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Customer extends StatefulWidget {
  static const String routeName = '/customer';

  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  TextEditingController controller = TextEditingController();
  List<Response> _searchResult = [];
  List<Response> listData = [];


  @override
  Widget build(BuildContext context) {
    apiBloc.fetchCustomerListsApi();
    return new Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBarCommon(context, 'Customer'),
      drawer: NavigationDrawer(),
      body: StreamBuilder(
        stream: apiBloc.customerListsApi,
        builder: (context, AsyncSnapshot<CustomerListResModel> snapshot) {
          if (snapshot.hasData && snapshot.data.status == 1 && snapshot.data.message == 'Success') {
            return LiquidPullToRefresh(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              onRefresh: () {
                return Future.delayed(
                  Duration(milliseconds: 700), () {
                    buildUi(snapshot.data.response);
                  },
                );
              },
              child: buildUi(snapshot.data.response),
            );
          } else if (snapshot.hasError) {
            return SomethingWrongScreen(onTap: () {});
          } else if (!snapshot.hasData) {
            return TltProgressbar();
          } else
            return NoDataFound(txt: 'No service found');
        },
      ),
    );
  }


  Widget buildUi(List<Response> response) {
    return Column(
      children: [
        SlideInLeft(
          child: Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Search for name, email, mobile...', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                  style: TextStyle(color: Colors.black54),
                ),
                trailing: Visibility(
                  visible: controller.text.isNotEmpty,
                  child: IconButton(
                    icon: Icon(Icons.cancel_outlined),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SlideInRight(
            child: Container(
              margin: EdgeInsets.only(bottom: 12, top: 8),
              //color: Colors.white,
              child: ListView.builder(
                  itemCount: _searchResult.length != 0 || controller.text.isNotEmpty? _searchResult.length : response.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                      return buildListContent(_searchResult, index);
                    } else {
                      listData = response;
                      return buildListContent(listData, index);
                    }
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildListContent(List<Response> response, int index) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 16, right: 16, top: 3, bottom: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey[100]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              child: cachedNetImgWithRadius(Strings.imgUrlNotFoundYellowAvatar, 5.9 * SizeConfig.heightMultiplier,
                  5.9 * SizeConfig.heightMultiplier, 25),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 5, 0),
                    child: TxtWithWidth(
                        txt: response[index].name,
                        txtColor: Colors.blueGrey,
                        txtSize: 14,
                        width: 40 * SizeConfig.widthMultiplier,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 3, 5, 0),
                  child: Text(
                    response[index].mobile,
                    style:
                    TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Colors.black54, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 5, 0),
                  child: TxtWithWidth(txt: response[index].email, txtColor: Colors.black54, txtSize: 12,
                      width: 40 * SizeConfig.widthMultiplier, fontWeight: FontWeight.normal),
                ),
              ],
            ),



            InkWell(
              child: Icon(
                Icons.call_outlined,
                color: Colors.green,
                size: 22,
              ),

              onTap: (){
                _launchCaller(response[index].mobile);
              },
            ),


            Padding(
              padding: const EdgeInsets.only(right: 6, left: 6),
              child: InkWell(
                child: Icon(
                  Icons.mail_outline_rounded,
                  color: Colors.blueGrey,
                  size: 20,
                ),
                onTap: (){
                  _launchEmail(response[index].email);
                },
              ),
            ),

            InkWell(
              child: Icon(
                Icons.delete_outline_rounded,
                color: Colors.red,
                size: 22,
              ),
              onTap: (){
                apiBloc.fetchDeleteCustomerApi(response[index].id);
                showRemoveCustomerDialog(context, onClose: (){
                  Navigator.pushNamed(context, Routes.customer_screen);
                });
              },
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Orders(screenTitle: 'Customer',)));
      },
    );
  }



  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listData.forEach((model) {
      if (model.name.toLowerCase().contains(text.toLowerCase()) ||
          model.email.toLowerCase().contains(text.toLowerCase()) ||
          model.mobile.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }

  _launchCaller(String contactNo) async {
    final url = "tel:$contactNo";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }

  _launchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=The Laundry Time&body=App Version 1.00', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
