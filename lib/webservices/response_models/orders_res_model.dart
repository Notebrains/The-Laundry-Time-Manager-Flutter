/// status : 1
/// message : "Success"
/// response : [{"order_status":"Pending","order_id":"17801475","order_date":"18 May 2021 01:21 PM","order_type":"Premium Order","total_amount":"119.85","discount_amount":"0.00","order_amount":"119.85","customer_name":"Tanay Mitra","total_items":4,"payment_status":"Pending","pickup_time":"","pickup_date":"","pickup_address":"","pickup_driver":"","dropoff_time":"","dropoff_date":"","dropoff_address":"","dropoff_driver":"","order_items":[{"item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","item_qty":"2","item_price":"20.00","addon_charge":"0.00","item_total":"40.00","addon_details":[{"addon_name":"Oil splash"},{"addon_name":"Dart"}],"offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_for":"Non Offer","item_name":"DRESS","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/dress1.png","item_qty":"3","item_price":"18.40","addon_charge":"21.00","item_total":"76.20","addon_details":[{"addon_name":"Oil splash"},{"addon_name":"Dart"}],"offer_items":[]},{"item_for":"Non Offer","item_name":"BLAZER/JACKET","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","item_qty":"2","item_price":"10.95","addon_charge":"0.00","item_total":"21.90","addon_details":[],"offer_items":[]}]},{"order_status":"Pickup Received","order_id":"54594319","order_date":"27 Apr 2021 07:00 PM","order_type":"Premium Order","total_amount":"94","discount_amount":"0.00","order_amount":"94.00","customer_name":"Tanay Mitra","total_items":3,"payment_status":"Completed","pickup_time":"10:00 AM-11:00 AM","pickup_date":"28 Apr 2021","pickup_address":"GUAM, 96913, USA","pickup_driver":"Shovon","dropoff_time":"06:00 PM-07:00 PM","dropoff_date":"01 May 2021","dropoff_address":"GUAM, 96913, USA","dropoff_driver":"Shovon","order_items":[{"item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","item_qty":"2","item_price":"20.00","addon_charge":"0.00","item_total":"40.00","addon_details":[],"offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_for":"Non Offer","item_name":"BEDSHEET","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/bed_sheet.png","item_qty":"3","item_price":"6.00","addon_charge":"0.00","item_total":"18.00","addon_details":[],"offer_items":[]}]}]

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

/// order_status : "Pending"
/// order_id : "17801475"
/// order_date : "18 May 2021 01:21 PM"
/// order_type : "Premium Order"
/// total_amount : "119.85"
/// discount_amount : "0.00"
/// order_amount : "119.85"
/// customer_name : "Tanay Mitra"
/// total_items : 4
/// payment_status : "Pending"
/// pickup_time : ""
/// pickup_date : ""
/// pickup_address : ""
/// pickup_driver : ""
/// dropoff_time : ""
/// dropoff_date : ""
/// dropoff_address : ""
/// dropoff_driver : ""
/// order_items : [{"item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","item_qty":"2","item_price":"20.00","addon_charge":"0.00","item_total":"40.00","addon_details":[{"addon_name":"Oil splash"},{"addon_name":"Dart"}],"offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_for":"Non Offer","item_name":"DRESS","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/dress1.png","item_qty":"3","item_price":"18.40","addon_charge":"21.00","item_total":"76.20","addon_details":[{"addon_name":"Oil splash"},{"addon_name":"Dart"}],"offer_items":[]},{"item_for":"Non Offer","item_name":"BLAZER/JACKET","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","item_qty":"2","item_price":"10.95","addon_charge":"0.00","item_total":"21.90","addon_details":[],"offer_items":[]}]

class Response {
  String _orderStatus;
  String _orderId;
  String _orderDate;
  String _orderType;
  String _totalAmount;
  String _discountAmount;
  String _orderAmount;
  String _customerName;
  int _totalItems;
  String _paymentStatus;
  String _pickupTime;
  String _pickupDate;
  String _pickupAddress;
  String _pickupDriver;
  String _dropoffTime;
  String _dropoffDate;
  String _dropoffAddress;
  String _dropoffDriver;
  List<Order_items> _orderItems;

  String get orderStatus => _orderStatus;
  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderType => _orderType;
  String get totalAmount => _totalAmount;
  String get discountAmount => _discountAmount;
  String get orderAmount => _orderAmount;
  String get customerName => _customerName;
  int get totalItems => _totalItems;
  String get paymentStatus => _paymentStatus;
  String get pickupTime => _pickupTime;
  String get pickupDate => _pickupDate;
  String get pickupAddress => _pickupAddress;
  String get pickupDriver => _pickupDriver;
  String get dropoffTime => _dropoffTime;
  String get dropoffDate => _dropoffDate;
  String get dropoffAddress => _dropoffAddress;
  String get dropoffDriver => _dropoffDriver;
  List<Order_items> get orderItems => _orderItems;

  Response({
      String orderStatus, 
      String orderId, 
      String orderDate, 
      String orderType, 
      String totalAmount, 
      String discountAmount, 
      String orderAmount, 
      String customerName, 
      int totalItems, 
      String paymentStatus, 
      String pickupTime, 
      String pickupDate, 
      String pickupAddress, 
      String pickupDriver, 
      String dropoffTime, 
      String dropoffDate, 
      String dropoffAddress, 
      String dropoffDriver, 
      List<Order_items> orderItems}){
    _orderStatus = orderStatus;
    _orderId = orderId;
    _orderDate = orderDate;
    _orderType = orderType;
    _totalAmount = totalAmount;
    _discountAmount = discountAmount;
    _orderAmount = orderAmount;
    _customerName = customerName;
    _totalItems = totalItems;
    _paymentStatus = paymentStatus;
    _pickupTime = pickupTime;
    _pickupDate = pickupDate;
    _pickupAddress = pickupAddress;
    _pickupDriver = pickupDriver;
    _dropoffTime = dropoffTime;
    _dropoffDate = dropoffDate;
    _dropoffAddress = dropoffAddress;
    _dropoffDriver = dropoffDriver;
    _orderItems = orderItems;
}

  Response.fromJson(dynamic json) {
    _orderStatus = json["order_status"];
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _orderType = json["order_type"];
    _totalAmount = json["total_amount"];
    _discountAmount = json["discount_amount"];
    _orderAmount = json["order_amount"];
    _customerName = json["customer_name"];
    _totalItems = json["total_items"];
    _paymentStatus = json["payment_status"];
    _pickupTime = json["pickup_time"];
    _pickupDate = json["pickup_date"];
    _pickupAddress = json["pickup_address"];
    _pickupDriver = json["pickup_driver"];
    _dropoffTime = json["dropoff_time"];
    _dropoffDate = json["dropoff_date"];
    _dropoffAddress = json["dropoff_address"];
    _dropoffDriver = json["dropoff_driver"];
    if (json["order_items"] != null) {
      _orderItems = [];
      json["order_items"].forEach((v) {
        _orderItems.add(Order_items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_status"] = _orderStatus;
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["order_type"] = _orderType;
    map["total_amount"] = _totalAmount;
    map["discount_amount"] = _discountAmount;
    map["order_amount"] = _orderAmount;
    map["customer_name"] = _customerName;
    map["total_items"] = _totalItems;
    map["payment_status"] = _paymentStatus;
    map["pickup_time"] = _pickupTime;
    map["pickup_date"] = _pickupDate;
    map["pickup_address"] = _pickupAddress;
    map["pickup_driver"] = _pickupDriver;
    map["dropoff_time"] = _dropoffTime;
    map["dropoff_date"] = _dropoffDate;
    map["dropoff_address"] = _dropoffAddress;
    map["dropoff_driver"] = _dropoffDriver;
    if (_orderItems != null) {
      map["order_items"] = _orderItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_for : "Offer"
/// item_name : "Wash 2 & Get 1 Wash Free"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg"
/// item_qty : "2"
/// item_price : "20.00"
/// addon_charge : "0.00"
/// item_total : "40.00"
/// addon_details : [{"addon_name":"Oil splash"},{"addon_name":"Dart"}]
/// offer_items : [{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]

class Order_items {
  String _itemFor;
  String _itemName;
  String _itemImage;
  String _itemQty;
  String _itemPrice;
  String _addonCharge;
  String _itemTotal;
  List<Addon_details> _addonDetails;
  List<Offer_items> _offerItems;

  String get itemFor => _itemFor;
  String get itemName => _itemName;
  String get itemImage => _itemImage;
  String get itemQty => _itemQty;
  String get itemPrice => _itemPrice;
  String get addonCharge => _addonCharge;
  String get itemTotal => _itemTotal;
  List<Addon_details> get addonDetails => _addonDetails;
  List<Offer_items> get offerItems => _offerItems;

  Order_items({
      String itemFor, 
      String itemName, 
      String itemImage, 
      String itemQty, 
      String itemPrice, 
      String addonCharge, 
      String itemTotal, 
      List<Addon_details> addonDetails, 
      List<Offer_items> offerItems}){
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
        _addonDetails.add(Addon_details.fromJson(v));
      });
    }
    if (json["offer_items"] != null) {
      _offerItems = [];
      json["offer_items"].forEach((v) {
        _offerItems.add(Offer_items.fromJson(v));
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

/// item_name : "BLAZER/JACKET"
/// item_qty : "2"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"

class Offer_items {
  String _itemName;
  String _itemQty;
  String _itemImage;

  String get itemName => _itemName;
  String get itemQty => _itemQty;
  String get itemImage => _itemImage;

  Offer_items({
      String itemName, 
      String itemQty, 
      String itemImage}){
    _itemName = itemName;
    _itemQty = itemQty;
    _itemImage = itemImage;
}

  Offer_items.fromJson(dynamic json) {
    _itemName = json["item_name"];
    _itemQty = json["item_qty"];
    _itemImage = json["item_image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_name"] = _itemName;
    map["item_qty"] = _itemQty;
    map["item_image"] = _itemImage;
    return map;
  }

}

/// addon_name : "Oil splash"

class Addon_details {
  String _addonName;

  String get addonName => _addonName;

  Addon_details({
      String addonName}){
    _addonName = addonName;
}

  Addon_details.fromJson(dynamic json) {
    _addonName = json["addon_name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["addon_name"] = _addonName;
    return map;
  }

}