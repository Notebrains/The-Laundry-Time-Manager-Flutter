/// status : 1
/// message : "Success"
/// response : [{"id":"52","offer_id":"","validity":"Expired","name":"Wash 2 & Get 1 Wash Free","category":"","subcategory":"","price":"20.00","production_type":"Dry Clean","image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","offer_items":[{"item_name":"BLAZER/JACKET","item_price":"12.00","item_qty":"2","total_price":"24.00","billable_qty":"2","billable_price":"24.00"}]}]

class OffersResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  OffersResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  OffersResModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["response"] != null) {
      _response = [];
      json["response"].forEach((v) {
        _response.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_response != null) {
      map["response"] = _response.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "52"
/// offer_id : ""
/// validity : "Expired"
/// name : "Wash 2 & Get 1 Wash Free"
/// category : ""
/// subcategory : ""
/// price : "20.00"
/// production_type : "Dry Clean"
/// image : "https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg"
/// offer_items : [{"item_name":"BLAZER/JACKET","item_price":"12.00","item_qty":"2","total_price":"24.00","billable_qty":"2","billable_price":"24.00"}]

class Response {
  String _id;
  String _offerId;
  String _validity;
  String _name;
  String _category;
  String _subcategory;
  String _price;
  String _productionType;
  String _image;
  List<Offer_items> _offerItems;

  String get id => _id;
  String get offerId => _offerId;
  String get validity => _validity;
  String get name => _name;
  String get category => _category;
  String get subcategory => _subcategory;
  String get price => _price;
  String get productionType => _productionType;
  String get image => _image;
  List<Offer_items> get offerItems => _offerItems;

  Response({
      String id, 
      String offerId, 
      String validity, 
      String name, 
      String category, 
      String subcategory, 
      String price, 
      String productionType, 
      String image, 
      List<Offer_items> offerItems}){
    _id = id;
    _offerId = offerId;
    _validity = validity;
    _name = name;
    _category = category;
    _subcategory = subcategory;
    _price = price;
    _productionType = productionType;
    _image = image;
    _offerItems = offerItems;
}

  Response.fromJson(dynamic json) {
    _id = json["id"];
    _offerId = json["offer_id"];
    _validity = json["validity"];
    _name = json["name"];
    _category = json["category"];
    _subcategory = json["subcategory"];
    _price = json["price"];
    _productionType = json["production_type"];
    _image = json["image"];
    if (json["offer_items"] != null) {
      _offerItems = [];
      json["offer_items"].forEach((v) {
        _offerItems.add(Offer_items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["offer_id"] = _offerId;
    map["validity"] = _validity;
    map["name"] = _name;
    map["category"] = _category;
    map["subcategory"] = _subcategory;
    map["price"] = _price;
    map["production_type"] = _productionType;
    map["image"] = _image;
    if (_offerItems != null) {
      map["offer_items"] = _offerItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_name : "BLAZER/JACKET"
/// item_price : "12.00"
/// item_qty : "2"
/// total_price : "24.00"
/// billable_qty : "2"
/// billable_price : "24.00"

class Offer_items {
  String _itemName;
  String _itemPrice;
  String _itemQty;
  String _totalPrice;
  String _billableQty;
  String _billablePrice;

  String get itemName => _itemName;
  String get itemPrice => _itemPrice;
  String get itemQty => _itemQty;
  String get totalPrice => _totalPrice;
  String get billableQty => _billableQty;
  String get billablePrice => _billablePrice;

  Offer_items({
      String itemName, 
      String itemPrice, 
      String itemQty, 
      String totalPrice, 
      String billableQty, 
      String billablePrice}){
    _itemName = itemName;
    _itemPrice = itemPrice;
    _itemQty = itemQty;
    _totalPrice = totalPrice;
    _billableQty = billableQty;
    _billablePrice = billablePrice;
}

  Offer_items.fromJson(dynamic json) {
    _itemName = json["item_name"];
    _itemPrice = json["item_price"];
    _itemQty = json["item_qty"];
    _totalPrice = json["total_price"];
    _billableQty = json["billable_qty"];
    _billablePrice = json["billable_price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_name"] = _itemName;
    map["item_price"] = _itemPrice;
    map["item_qty"] = _itemQty;
    map["total_price"] = _totalPrice;
    map["billable_qty"] = _billableQty;
    map["billable_price"] = _billablePrice;
    return map;
  }

}