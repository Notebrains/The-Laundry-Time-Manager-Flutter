import 'package:flutter/material.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';

class BestOffers extends StatefulWidget {
  final List<Offers_list> dataList;

  BestOffers({Key key, this.dataList}) : super(key: key);

  @override
  _BestOffersState createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  TextEditingController controller = TextEditingController();
  List<Offers_list> _searchResult = [];
  List<Offers_list> listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Name, cat, subcat, validity...', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
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
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _searchResult.length != 0 || controller.text.isNotEmpty ? _searchResult.length : widget.dataList.length,
              itemBuilder: (context, index) {
                if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                  return OffersListWidget(
                    response: _searchResult,
                    index: index,
                    onTapOnList: () {
                      //Navigator.pushNamed(context, Routes.order_details_screen);
                    },
                    onTapOnBtn: (value) {
                      //showBottomSheetUi(widget.dataList[index].offerItems);
                    },
                    onTapOnItems: (index) {
                      //showBottomSheetUi();
                    },
                    onRefresh: () {
                      //setState(() {});
                    },
                  );
                } else {
                  listData = widget.dataList;
                  return OffersListWidget(
                    response: listData,
                    index: index,
                    onTapOnList: () {},
                    onTapOnBtn: (value) {
                      //showBottomSheetUi(listData[index].offerItems);
                    },
                    onTapOnItems: (index) {
                      //showBottomSheetUi();
                    },
                    onRefresh: () {
                      //setState(() {});
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
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
          model.validity.toLowerCase().contains(text.toLowerCase()) ||
          model.productionType.toLowerCase().contains(text.toLowerCase()) ||
          model.category.toLowerCase().contains(text.toLowerCase()) ||
          model.subcategory.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }

}
