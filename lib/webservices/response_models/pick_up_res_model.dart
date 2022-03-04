
class PickUpResModel {
  PickUpResModel({
      int status, 
      String message, 
      List<Response> response,}){
    _status = status;
    _message = message;
    _response = response;
}

  PickUpResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response.add(Response.fromJson(v));
      });
    }
  }
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Response {
  Response({
      String orderId, 
      String orderDate, 
      String orderType, 
      String dropoffDate, 
      String dropoffTime, 
      String driverName, 
      String driverMobile, 
      String customerName, 
      String dropoffAddress, 
      int totalItems, 
      String orderAmount, 
      String taxAmount, 
      String deliveryCharges, 
      String serviceCharge, 
      String totalAddonPrice, 
      String discount, 
      String offerDiscount, 
      String orderStatus, 
      String paymentStatus, 
      String paymentMode,
    String itemTotal,
    String deliveryType,
    String cutoffCharge,
    String zipcodeDeliveryCharge,


      List<Item_details> itemDetails,}){
    _orderId = orderId;
    _orderDate = orderDate;
    _orderType = orderType;
    _dropoffDate = dropoffDate;
    _dropoffTime = dropoffTime;
    _driverName = driverName;
    _driverMobile = driverMobile;
    _customerName = customerName;
    _dropoffAddress = dropoffAddress;
    _totalItems = totalItems;
    _orderAmount = orderAmount;
    _taxAmount = taxAmount;
    _deliveryCharges = deliveryCharges;
    _serviceCharge = serviceCharge;
    _totalAddonPrice = totalAddonPrice;
    _discount = discount;
    _offerDiscount = offerDiscount;
    _orderStatus = orderStatus;
    _paymentStatus = paymentStatus;
    _paymentMode = paymentMode;
    _itemDetails = itemDetails;
    _itemTotal = itemTotal;
    _deliveryType = deliveryType;
    _cutoffCharge = cutoffCharge;
    _zipcodeDeliveryCharge = zipcodeDeliveryCharge;
}

  Response.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _orderDate = json['order_date'];
    _orderType = json['order_type'];
    _dropoffDate = json['dropoff_date'];
    _dropoffTime = json['dropoff_time'];
    _driverName = json['driver_name'];
    _driverMobile = json['driver_mobile'];
    _customerName = json['customer_name'];
    _dropoffAddress = json['dropoff_address'];
    _totalItems = json['total_items'];
    _orderAmount = json['order_amount'];
    _taxAmount = json['tax_amount'];
    _deliveryCharges = json['delivery_charges'];
    _serviceCharge = json['service_charge'];
    _totalAddonPrice = json['total_addon_price'];
    _discount = json['discount'];
    _offerDiscount = json['offer_discount'];
    _orderStatus = json['order_status'];
    _paymentStatus = json['payment_status'];
    _paymentMode = json['payment_mode'];
    _itemTotal = json['item_total'];
    _deliveryType = json['delivery_type'];
    _cutoffCharge = json['cutoff_charge'];
    _zipcodeDeliveryCharge = json['zipcode_delivery_charge'];

    if (json['item_details'] != null) {
      _itemDetails = [];
      json['item_details'].forEach((v) {
        _itemDetails.add(Item_details.fromJson(v));
      });
    }
  }
  String _orderId;
  String _orderDate;
  String _orderType;
  String _dropoffDate;
  String _dropoffTime;
  String _driverName;
  String _driverMobile;
  String _customerName;
  String _dropoffAddress;
  int _totalItems;
  String _orderAmount;
  String _taxAmount;
  String _deliveryCharges;
  String _serviceCharge;
  String _totalAddonPrice;
  String _discount;
  String _offerDiscount;
  String _orderStatus;
  String _paymentStatus;
  String _paymentMode;
  String _itemTotal;
  String _deliveryType;
  String _cutoffCharge;
  String _zipcodeDeliveryCharge;
  List<Item_details> _itemDetails;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderType => _orderType;
  String get dropoffDate => _dropoffDate;
  String get dropoffTime => _dropoffTime;
  String get driverName => _driverName;
  String get driverMobile => _driverMobile;
  String get customerName => _customerName;
  String get dropoffAddress => _dropoffAddress;
  int get totalItems => _totalItems;
  String get orderAmount => _orderAmount;
  String get taxAmount => _taxAmount;
  String get deliveryCharges => _deliveryCharges;
  String get serviceCharge => _serviceCharge;
  String get totalAddonPrice => _totalAddonPrice;
  String get discount => _discount;
  String get offerDiscount => _offerDiscount;
  String get orderStatus => _orderStatus;
  String get paymentStatus => _paymentStatus;
  String get paymentMode => _paymentMode;
  String get itemTotal => _itemTotal;
  String get deliveryType => _deliveryType;
  String get cutoffCharge => _cutoffCharge;
  String get zipcodeDeliveryCharge => _zipcodeDeliveryCharge;
  List<Item_details> get itemDetails => _itemDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['order_date'] = _orderDate;
    map['order_type'] = _orderType;
    map['dropoff_date'] = _dropoffDate;
    map['dropoff_time'] = _dropoffTime;
    map['driver_name'] = _driverName;
    map['driver_mobile'] = _driverMobile;
    map['customer_name'] = _customerName;
    map['dropoff_address'] = _dropoffAddress;
    map['total_items'] = _totalItems;
    map['order_amount'] = _orderAmount;
    map['tax_amount'] = _taxAmount;
    map['delivery_charges'] = _deliveryCharges;
    map['service_charge'] = _serviceCharge;
    map['total_addon_price'] = _totalAddonPrice;
    map['discount'] = _discount;
    map['offer_discount'] = _offerDiscount;
    map['order_status'] = _orderStatus;
    map['payment_status'] = _paymentStatus;
    map['payment_mode'] = _paymentMode;
    map['item_total'] = _itemTotal;
    map['delivery_type'] = _deliveryType;
    map['cutoff_charge'] = _cutoffCharge;
    map['zipcode_delivery_charge'] = _zipcodeDeliveryCharge;
    if (_itemDetails != null) {
      map['item_details'] = _itemDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_for : "Non Offer"
/// item_name : "Dress"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/kids_dress1.png"
/// item_qty : "1"
/// item_price : "15.64"
/// addon_charge : "0.00"
/// item_total : "15.64"
/// addon_details : []
/// offer_items : []

class Item_details {
  Item_details({
      String itemFor, 
      String itemName, 
      String itemImage, 
      String itemQty, 
      String itemPrice, 
      String addonCharge, 
      String itemTotal, 
      List<Addon_details> addonDetails,
      List<Offer_items> offerItems,}){
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
    _itemFor = json['item_for'];
    _itemName = json['item_name'];
    _itemImage = json['item_image'];
    _itemQty = json['item_qty'];
    _itemPrice = json['item_price'];
    _addonCharge = json['addon_charge'];
    _itemTotal = json['item_total'];
    if (json['addon_details'] != null) {
      _addonDetails = [];
      json['addon_details'].forEach((v) {
        _addonDetails.add(Addon_details.fromJson(v));
      });
    }
    if (json['offer_items'] != null) {
      _offerItems = [];
      json['offer_items'].forEach((v) {
        _offerItems.add(Offer_items.fromJson(v));
      });
    }
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_for'] = _itemFor;
    map['item_name'] = _itemName;
    map['item_image'] = _itemImage;
    map['item_qty'] = _itemQty;
    map['item_price'] = _itemPrice;
    map['addon_charge'] = _addonCharge;
    map['item_total'] = _itemTotal;
    if (_addonDetails != null) {
      map['addon_details'] = _addonDetails.map((v) => v.toJson()).toList();
    }
    if (_offerItems != null) {
      map['offer_items'] = _offerItems.map((v) => v.toJson()).toList();
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