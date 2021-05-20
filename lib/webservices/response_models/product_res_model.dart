/// status : 1
/// message : "Success"
/// response : [{"id":"17","item_name":"DRESS","item_type":"Non Offer","item_id":"WW-01","category":"WOMEN'S WEAR","subcategory":"CLOTHING","image":"https://mridayadevstudio.com/tlt_dev/uploads/dress1.png","description":"Light red fancy dress","price_details":[{"production_type":"Dry Clean","price":"18.40"},{"production_type":"Laundry","price":"15.00"},{"production_type":"Press Only","price":"5.00"},{"production_type":"Wash and Fold","price":"4.00"}],"addon_details":[{"addon_name":"Oil splash","addon_price":"2.00"},{"addon_name":"Dart","addon_price":"1.00"}]}]

class ProductResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  ProductResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  ProductResModel.fromJson(dynamic json) {
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

/// id : "17"
/// item_name : "DRESS"
/// item_type : "Non Offer"
/// item_id : "WW-01"
/// category : "WOMEN'S WEAR"
/// subcategory : "CLOTHING"
/// image : "https://mridayadevstudio.com/tlt_dev/uploads/dress1.png"
/// description : "Light red fancy dress"
/// price_details : [{"production_type":"Dry Clean","price":"18.40"},{"production_type":"Laundry","price":"15.00"},{"production_type":"Press Only","price":"5.00"},{"production_type":"Wash and Fold","price":"4.00"}]
/// addon_details : [{"addon_name":"Oil splash","addon_price":"2.00"},{"addon_name":"Dart","addon_price":"1.00"}]

class Response {
  String _id;
  String _itemName;
  String _itemType;
  String _itemId;
  String _category;
  String _subcategory;
  String _image;
  String _description;
  List<Price_details> _priceDetails;
  List<Addon_details> _addonDetails;

  String get id => _id;
  String get itemName => _itemName;
  String get itemType => _itemType;
  String get itemId => _itemId;
  String get category => _category;
  String get subcategory => _subcategory;
  String get image => _image;
  String get description => _description;
  List<Price_details> get priceDetails => _priceDetails;
  List<Addon_details> get addonDetails => _addonDetails;

  Response({
      String id, 
      String itemName, 
      String itemType, 
      String itemId, 
      String category, 
      String subcategory, 
      String image, 
      String description, 
      List<Price_details> priceDetails, 
      List<Addon_details> addonDetails}){
    _id = id;
    _itemName = itemName;
    _itemType = itemType;
    _itemId = itemId;
    _category = category;
    _subcategory = subcategory;
    _image = image;
    _description = description;
    _priceDetails = priceDetails;
    _addonDetails = addonDetails;
}

  Response.fromJson(dynamic json) {
    _id = json["id"];
    _itemName = json["item_name"];
    _itemType = json["item_type"];
    _itemId = json["item_id"];
    _category = json["category"];
    _subcategory = json["subcategory"];
    _image = json["image"];
    _description = json["description"];
    if (json["price_details"] != null) {
      _priceDetails = [];
      json["price_details"].forEach((v) {
        _priceDetails.add(Price_details.fromJson(v));
      });
    }
    if (json["addon_details"] != null) {
      _addonDetails = [];
      json["addon_details"].forEach((v) {
        _addonDetails.add(Addon_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["item_name"] = _itemName;
    map["item_type"] = _itemType;
    map["item_id"] = _itemId;
    map["category"] = _category;
    map["subcategory"] = _subcategory;
    map["image"] = _image;
    map["description"] = _description;
    if (_priceDetails != null) {
      map["price_details"] = _priceDetails.map((v) => v.toJson()).toList();
    }
    if (_addonDetails != null) {
      map["addon_details"] = _addonDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// addon_name : "Oil splash"
/// addon_price : "2.00"

class Addon_details {
  String _addonName;
  String _addonPrice;

  String get addonName => _addonName;
  String get addonPrice => _addonPrice;

  Addon_details({
      String addonName, 
      String addonPrice}){
    _addonName = addonName;
    _addonPrice = addonPrice;
}

  Addon_details.fromJson(dynamic json) {
    _addonName = json["addon_name"];
    _addonPrice = json["addon_price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["addon_name"] = _addonName;
    map["addon_price"] = _addonPrice;
    return map;
  }

}

/// production_type : "Dry Clean"
/// price : "18.40"

class Price_details {
  String _productionType;
  String _price;

  String get productionType => _productionType;
  String get price => _price;

  Price_details({
      String productionType, 
      String price}){
    _productionType = productionType;
    _price = price;
}

  Price_details.fromJson(dynamic json) {
    _productionType = json["production_type"];
    _price = json["price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["production_type"] = _productionType;
    map["price"] = _price;
    return map;
  }

}