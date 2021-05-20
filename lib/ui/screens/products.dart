import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/ui/widgets/product_list_widget.dart';
import 'package:tlt_manager/webservices/response_models/product_res_model.dart';

class Product extends StatefulWidget {
  static const String routeName = '/product';

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Response> _searchResult = [];
  List<Response> listData = [];
  List<String> _itemDropDownList = [
    'Trouser',
    'Pants',
  ]; // Option 2
  String _selectedItem;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    apiBloc.fetchItemsApi();
    return Scaffold(
      appBar: AppBarCommon(context, 'Product'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: apiBloc.itemsApi,
        builder: (context, AsyncSnapshot<ProductResModel> snapshot) {
          if (snapshot.hasData && snapshot.data.status == 1 && snapshot.data.message == 'Success') {
            return LiquidPullToRefresh(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              onRefresh: () {
                return Future.delayed(
                  Duration(milliseconds: 700),
                  () {
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
            return  NoDataFound(txt: 'No data found', onRefresh: (){
              setState(() {

              });
            },);
        },
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    return Column(
      children: [
        FadeInDown(
          child: Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Item, category, subcategory...', border: InputBorder.none),
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
        ),
        /*

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: FadeInLeftBig(
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  margin: const EdgeInsets.only(bottom: 5, top: 8, left: 16, right: 4),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(5.0), border: Border.all(color: Colors.grey[400])),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    underline: Container(),
                    hint: Text("Select Cat"),
                    items: <String>[
                      'Men Wear',
                      'Child',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FadeInRightBig(
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  margin: const EdgeInsets.only(bottom: 5, top: 6, left: 4, right: 16),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(5.0), border: Border.all(color: Colors.grey[400])),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    underline: Container(),
                    hint: Text("Select Subcat"),
                    items: <String>[
                      'Half pants',
                      'Full pants',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 40.0,
          margin: const EdgeInsets.only(bottom: 5, top: 5, left: 16, right: 16),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0), border: Border.all(color: Colors.grey[400])),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            underline: Container(),
            hint: Text("Select Item"),
            items: _itemDropDownList.map((String value) {
              return DropdownMenuItem<String>(
                value: _selectedItem,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
          ),
        ),

        */
        Expanded(
          child: FadeInUpBig(
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              //color: Colors.white,
              child: ListView.builder(
                  itemCount: _searchResult.length != 0 || controller.text.isNotEmpty ? _searchResult.length : response.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_searchResult.length != 0 || controller.text.isNotEmpty) {
                      return ProductListWidget(
                        response: _searchResult,
                        index: index,
                        onTapOnList: null,
                        onRefresh: (){setState(() {});},
                      );
                    } else {
                      listData = response;
                      return ProductListWidget(
                        response: listData,
                        index: index,
                        onTapOnList: null,
                        onRefresh: (){setState(() {});},
                      );
                    }
                  },
              ),
            ),
          ),
        ),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listData.forEach((model) {
      if (
          model.id.toLowerCase().contains(text.toLowerCase()) ||
          model.category.toLowerCase().contains(text.toLowerCase()) ||
          model.subcategory.toLowerCase().contains(text.toLowerCase()) ||
          model.itemName.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(model);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});
  }
}
