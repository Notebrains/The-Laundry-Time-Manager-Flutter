import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:tlt_manager/helper/libraries/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tlt_manager/ui/exports/routes.dart';
import 'package:tlt_manager/ui/exports/widgets.dart';
import 'package:tlt_manager/ui/widgets/product_list_widget.dart';

class Product extends StatefulWidget {
  static const String routeName = '/product';

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<String> _itemDropDownList = ['Trouser', 'Pants',]; // Option 2
  String _selectedItem;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(context, 'Product'),
      drawer: NavigationDrawer(),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: LiquidPullToRefresh(
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        onRefresh: () {
          return Future.delayed(
            Duration(milliseconds: 700),
            () {
              buildUi();
            },
          );
        },
        child: buildUi(),
      ),
    );
  }

  Widget buildUi() {
    //print('----${offerList.length}');
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
            child: ProductListWidget(
              onTapOnList: () {
                //Navigator.pushNamed(context, Routes.order_details_screen);
              },
              onTapOnBtn: (value) {},
              onTapOnItems: (index) {
                //showBottomSheetUi();
              },
            ),
          ),
        ),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    /* _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listData.forEach((itemDetail) {
      if (itemDetail.itemName.toLowerCase().contains(text.toLowerCase())){
        _searchResult.add(itemDetail);
        print('----Search List: ${_searchResult.length}');
      }
    });

    setState(() {});*/
  }
}
