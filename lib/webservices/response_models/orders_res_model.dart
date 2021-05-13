/// status : 1
/// message : "Success"
/// response : [{"order_id":"98390044","order_date":"29 Apr 2021 01:56 PM","order_type":"Premium Order","order_amount":"30.00","customer_name":"Tanay Mitra","total_items":1,"payment_status":"Pending","pickup":"30 Apr 2021(12:00 PM-01:00 PM)","dropoff":"","order_items":[{"item_for":"Non Offer","item_name":"BLAZER/JACKET","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","item_qty":"3","item_price":"10.00","addon_charge":"0.00","item_total":"30.00","addon_details":[],"offer_items":[]}]}]

class OrdersResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  OrdersResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  OrdersResModel.fromJson(dynamic json) {
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

/// order_id : "98390044"
/// order_date : "29 Apr 2021 01:56 PM"
/// order_type : "Premium Order"
/// order_amount : "30.00"
/// customer_name : "Tanay Mitra"
/// total_items : 1
/// payment_status : "Pending"
/// pickup : "30 Apr 2021(12:00 PM-01:00 PM)"
/// dropoff : ""
/// order_items : [{"item_for":"Non Offer","item_name":"BLAZER/JACKET","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","item_qty":"3","item_price":"10.00","addon_charge":"0.00","item_total":"30.00","addon_details":[],"offer_items":[]}]

class Response {
  String _orderId;
  String _orderDate;
  String _orderType;
  String _orderAmount;
  String _customerName;
  int _totalItems;
  String _paymentStatus;
  String _pickup;
  String _dropoff;
  List<Order_items> _orderItems;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderType => _orderType;
  String get orderAmount => _orderAmount;
  String get customerName => _customerName;
  int get totalItems => _totalItems;
  String get paymentStatus => _paymentStatus;
  String get pickup => _pickup;
  String get dropoff => _dropoff;
  List<Order_items> get orderItems => _orderItems;

  Response({
      String orderId, 
      String orderDate, 
      String orderType, 
      String orderAmount, 
      String customerName, 
      int totalItems, 
      String paymentStatus, 
      String pickup, 
      String dropoff, 
      List<Order_items> orderItems}){
    _orderId = orderId;
    _orderDate = orderDate;
    _orderType = orderType;
    _orderAmount = orderAmount;
    _customerName = customerName;
    _totalItems = totalItems;
    _paymentStatus = paymentStatus;
    _pickup = pickup;
    _dropoff = dropoff;
    _orderItems = orderItems;
}

  Response.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _orderType = json["order_type"];
    _orderAmount = json["order_amount"];
    _customerName = json["customer_name"];
    _totalItems = json["total_items"];
    _paymentStatus = json["payment_status"];
    _pickup = json["pickup"];
    _dropoff = json["dropoff"];
    if (json["order_items"] != null) {
      _orderItems = [];
      json["order_items"].forEach((v) {
        _orderItems.add(Order_items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["order_type"] = _orderType;
    map["order_amount"] = _orderAmount;
    map["customer_name"] = _customerName;
    map["total_items"] = _totalItems;
    map["payment_status"] = _paymentStatus;
    map["pickup"] = _pickup;
    map["dropoff"] = _dropoff;
    if (_orderItems != null) {
      map["order_items"] = _orderItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_for : "Non Offer"
/// item_name : "BLAZER/JACKET"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"
/// item_qty : "3"
/// item_price : "10.00"
/// addon_charge : "0.00"
/// item_total : "30.00"
/// addon_details : []
/// offer_items : []

class Order_items {
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

  Order_items({
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

  Order_items.fromJson(dynamic json) {
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