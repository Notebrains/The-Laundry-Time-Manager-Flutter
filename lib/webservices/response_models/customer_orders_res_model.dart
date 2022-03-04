
class CustomerOrdersResModel {
  int _status;
  String _message;
  Response _response;

  int get status => _status;
  String get message => _message;
  Response get response => _response;

  CustomerOrdersResModel({
      int status, 
      String message, 
      Response response}){
    _status = status;
    _message = message;
    _response = response;
}

  CustomerOrdersResModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _response = json["response"] != null ? Response.fromJson(json["response"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_response != null) {
      map["response"] = _response.toJson();
    }
    return map;
  }

}

class Response {
  String _totalSpent;
  List<Order_details> _orderDetails;

  String get totalSpent => _totalSpent;
  List<Order_details> get orderDetails => _orderDetails;

  Response({
    String totalSpent,
      List<Order_details> orderDetails}){
    _totalSpent = totalSpent;
    _orderDetails = orderDetails;
}

  Response.fromJson(dynamic json) {
    _totalSpent = json["total_spent"];
    if (json["order_details"] != null) {
      _orderDetails = [];
      json["order_details"].forEach((v) {
        _orderDetails.add(Order_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total_spent"] = _totalSpent;
    if (_orderDetails != null) {
      map["order_details"] = _orderDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Order_details {
  String _orderStatus;
  String _orderId;
  String _orderDate;
  String _orderType;
  String _orderAmount;
  String _customerName;
  String _customerEmail;
  String _customerMobile;
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
  List<dynamic> _orderReview;

  String get orderStatus => _orderStatus;
  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderType => _orderType;
  String get orderAmount => _orderAmount;
  String get customerName => _customerName;
  String get customerEmail => _customerEmail;
  String get customerMobile => _customerMobile;
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
  List<dynamic> get orderReview => _orderReview;

  Order_details({
      String orderStatus, 
      String orderId, 
      String orderDate, 
      String orderType, 
      String orderAmount, 
      String customerName, 
      String customerEmail, 
      String customerMobile, 
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
      List<Order_items> orderItems, 
      List<dynamic> orderReview}){
    _orderStatus = orderStatus;
    _orderId = orderId;
    _orderDate = orderDate;
    _orderType = orderType;
    _orderAmount = orderAmount;
    _customerName = customerName;
    _customerEmail = customerEmail;
    _customerMobile = customerMobile;
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
    _orderReview = orderReview;
}

  Order_details.fromJson(dynamic json) {
    _orderStatus = json["order_status"];
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _orderType = json["order_type"];
    _orderAmount = json["order_amount"];
    _customerName = json["customer_name"];
    _customerEmail = json["customer_email"];
    _customerMobile = json["customer_mobile"];
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
    if (json["order_review"] != null) {
      _orderReview = [];
      json["order_review"].forEach((v) {
        //_orderReview.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_status"] = _orderStatus;
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["order_type"] = _orderType;
    map["order_amount"] = _orderAmount;
    map["customer_name"] = _customerName;
    map["customer_email"] = _customerEmail;
    map["customer_mobile"] = _customerMobile;
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
    if (_orderReview != null) {
      map["order_review"] = _orderReview.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_for : "Non Offer"
/// item_name : "SWEATER"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/sweater1.png"
/// item_qty : "5"
/// item_price : "10.95"
/// addon_charge : "0.00"
/// item_total : "54.75"
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