/// status : 1
/// message : "Success"
/// response : [{"order_id":"39429236","dropoff_date":"09 Apr 2021","dropoff_time":"12:00 PM-01:00 PM","driver_name":"Shovon","customer_name":"Tanay Mitra","dropoff_address":"GUAM, 96913, USA","total_items":2,"order_amount":"121.00","item_details":[{"item_for":"Non Offer","item_name":"SMALL WEDDING GOWN","item_image":"http://localhost/laundry_time/uploads/shutterstock_4338919991.png","item_qty":"1","item_price":"110.00","addon_charge":"0.00","item_total":"110.00","addon_details":[],"offer_items":[]},{"item_for":"Non Offer","item_name":"JEANS/DENIM","item_image":"http://localhost/laundry_time/uploads/jeans-denim.png","item_qty":"1","item_price":"12.00","addon_charge":"0.00","item_total":"12.00","addon_details":[],"offer_items":[]}]}]

class PickUpResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  PickUpResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  PickUpResModel.fromJson(dynamic json) {
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

/// order_id : "39429236"
/// dropoff_date : "09 Apr 2021"
/// dropoff_time : "12:00 PM-01:00 PM"
/// driver_name : "Shovon"
/// customer_name : "Tanay Mitra"
/// dropoff_address : "GUAM, 96913, USA"
/// total_items : 2
/// order_amount : "121.00"
/// item_details : [{"item_for":"Non Offer","item_name":"SMALL WEDDING GOWN","item_image":"http://localhost/laundry_time/uploads/shutterstock_4338919991.png","item_qty":"1","item_price":"110.00","addon_charge":"0.00","item_total":"110.00","addon_details":[],"offer_items":[]},{"item_for":"Non Offer","item_name":"JEANS/DENIM","item_image":"http://localhost/laundry_time/uploads/jeans-denim.png","item_qty":"1","item_price":"12.00","addon_charge":"0.00","item_total":"12.00","addon_details":[],"offer_items":[]}]

class Response {
  String _orderId;
  String _dropoffDate;
  String _dropoffTime;
  String _driverName;
  String _driverMobile;
  String _customerName;
  String _dropoffAddress;
  int _totalItems;
  String _orderAmount;
  List<Item_details> _itemDetails;

  String get orderId => _orderId;
  String get dropoffDate => _dropoffDate;
  String get dropoffTime => _dropoffTime;
  String get driverName => _driverName;
  String get driverMobile => _driverMobile;
  String get customerName => _customerName;
  String get dropoffAddress => _dropoffAddress;
  int get totalItems => _totalItems;
  String get orderAmount => _orderAmount;
  List<Item_details> get itemDetails => _itemDetails;

  Response({
      String orderId, 
      String dropoffDate, 
      String dropoffTime, 
      String driverName, 
      String driverMobile,
      String customerName,
      String dropoffAddress, 
      int totalItems, 
      String orderAmount, 
      List<Item_details> itemDetails
  }){
    _orderId = orderId;
    _dropoffDate = dropoffDate;
    _dropoffTime = dropoffTime;
    _driverName = driverName;
    _driverMobile = driverMobile;
    _customerName = customerName;
    _dropoffAddress = dropoffAddress;
    _totalItems = totalItems;
    _orderAmount = orderAmount;
    _itemDetails = itemDetails;
}

  Response.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _dropoffDate = json["dropoff_date"];
    _dropoffTime = json["dropoff_time"];
    _driverName = json["driver_name"];
    _driverMobile = json["driver_mobile"];
    _customerName = json["customer_name"];
    _dropoffAddress = json["dropoff_address"];
    _totalItems = json["total_items"];
    _orderAmount = json["order_amount"];
    if (json["item_details"] != null) {
      _itemDetails = [];
      json["item_details"].forEach((v) {
        _itemDetails.add(Item_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["dropoff_date"] = _dropoffDate;
    map["dropoff_time"] = _dropoffTime;
    map["driver_name"] = _driverName;
    map["driver_mobile"] = _driverMobile;
    map["customer_name"] = _customerName;
    map["dropoff_address"] = _dropoffAddress;
    map["total_items"] = _totalItems;
    map["order_amount"] = _orderAmount;
    if (_itemDetails != null) {
      map["item_details"] = _itemDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_for : "Non Offer"
/// item_name : "SMALL WEDDING GOWN"
/// item_image : "http://localhost/laundry_time/uploads/shutterstock_4338919991.png"
/// item_qty : "1"
/// item_price : "110.00"
/// addon_charge : "0.00"
/// item_total : "110.00"
/// addon_details : []
/// offer_items : []

class Item_details {
  String _itemFor;
  String _itemName;
  String _itemImage;
  String _itemQty;
  String _itemPrice;
  String _addonCharge;
  String _itemTotal;
  List<dynamic> _addonDetails;
  List<dynamic> _offerItems;

  String get itemFor => _itemFor;
  String get itemName => _itemName;
  String get itemImage => _itemImage;
  String get itemQty => _itemQty;
  String get itemPrice => _itemPrice;
  String get addonCharge => _addonCharge;
  String get itemTotal => _itemTotal;
  List<dynamic> get addonDetails => _addonDetails;
  List<dynamic> get offerItems => _offerItems;

  Item_details({
      String itemFor, 
      String itemName, 
      String itemImage, 
      String itemQty, 
      String itemPrice, 
      String addonCharge, 
      String itemTotal, 
      List<dynamic> addonDetails, 
      List<dynamic> offerItems}){
    _itemFor = itemFor;
    _itemName = itemName;
    _itemImage = itemImage;
    _itemQty = itemQty;
    _itemPrice = itemPrice;
    _addonCharge = addonCharge;
    _itemTotal = itemTotal;
    _addonDetails = addonDetails;
    _offerItems = offerItems;
}

  Item_details.fromJson(dynamic json) {
    _itemFor = json["item_for"];
    _itemName = json["item_name"];
    _itemImage = json["item_image"];
    _itemQty = json["item_qty"];
    _itemPrice = json["item_price"];
    _addonCharge = json["addon_charge"];
    _itemTotal = json["item_total"];
    if (json["addon_details"] != null) {
      _addonDetails = [];
      json["addon_details"].forEach((v) {
        //_addonDetails.add(dynamic.fromJson(v));
      });
    }
    if (json["offer_items"] != null) {
      _offerItems = [];
      json["offer_items"].forEach((v) {
        //_offerItems.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_for"] = _itemFor;
    map["item_name"] = _itemName;
    map["item_image"] = _itemImage;
    map["item_qty"] = _itemQty;
    map["item_price"] = _itemPrice;
    map["addon_charge"] = _addonCharge;
    map["item_total"] = _itemTotal;
    if (_addonDetails != null) {
      map["addon_details"] = _addonDetails.map((v) => v.toJson()).toList();
    }
    if (_offerItems != null) {
      map["offer_items"] = _offerItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}