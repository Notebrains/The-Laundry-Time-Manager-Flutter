class OrdersResModel {
  OrdersResModel({
      int status, 
      String message, 
      List<Response> response,}){
    _status = status;
    _message = message;
    _response = response;
}

  OrdersResModel.fromJson(dynamic json) {
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

/*
"item_total": "",
"zipcode_delivery_charge": "20.00",
"cutoff_charge": "0.00",
"delivery_type": "2",
 */

class Response {
  Response({
      String orderStatus, 
      String orderId, 
      String orderDate, 
      String orderType, 
      String totalAmount, 
      String discountAmount, 
      String orderAmount, 
      String taxAmount, 
      String deliveryCharges, 
      String serviceCharge, 
      String totalAddonPrice, 
      String discount, 
      String offerDiscount, 
      String customerName, 
      String customerEmail, 
      String customerMobile, 
      int totalItems, 
      String paymentStatus, 
      String paymentMode, 
      String pickupTime, 
      String pickupDate, 
      String pickupAddress, 
      String pickupDriver, 
      String dropoffTime, 
      String dropoffDate, 
      String dropoffAddress, 
      String dropoffDriver,
      String itemTotal,
      String deliveryType,
      String cutoffCharge,
      String zipcodeDeliveryCharge,


      List<Order_items> orderItems,
      List<Order_review> orderReview}){
    _orderStatus = orderStatus;
    _orderId = orderId;
    _orderDate = orderDate;
    _orderType = orderType;
    _totalAmount = totalAmount;
    _discountAmount = discountAmount;
    _orderAmount = orderAmount;
    _taxAmount = taxAmount;
    _deliveryCharges = deliveryCharges;
    _serviceCharge = serviceCharge;
    _totalAddonPrice = totalAddonPrice;
    _discount = discount;
    _offerDiscount = offerDiscount;
    _customerName = customerName;
    _customerEmail = customerEmail;
    _customerMobile = customerMobile;
    _totalItems = totalItems;
    _paymentStatus = paymentStatus;
    _paymentMode = paymentMode;
    _pickupTime = pickupTime;
    _pickupDate = pickupDate;
    _pickupAddress = pickupAddress;
    _pickupDriver = pickupDriver;
    _dropoffTime = dropoffTime;
    _dropoffDate = dropoffDate;
    _dropoffAddress = dropoffAddress;
    _dropoffDriver = dropoffDriver;
    _itemTotal = itemTotal;
    _deliveryType = deliveryType;
    _cutoffCharge = cutoffCharge;
    _zipcodeDeliveryCharge = zipcodeDeliveryCharge;
    _orderItems = orderItems;
    _orderReview = orderReview;
}

  Response.fromJson(dynamic json) {
    _orderStatus = json['order_status'];
    _orderId = json['order_id'];
    _orderDate = json['order_date'];
    _orderType = json['order_type'];
    _totalAmount = json['total_amount'];
    _discountAmount = json['discount_amount'];
    _orderAmount = json['order_amount'];
    _taxAmount = json['tax_amount'];
    _deliveryCharges = json['delivery_charges'];
    _serviceCharge = json['service_charge'];
    _totalAddonPrice = json['total_addon_price'];
    _discount = json['discount'];
    _offerDiscount = json['offer_discount'];
    _customerName = json['customer_name'];
    _customerEmail = json['customer_email'];
    _customerMobile = json['customer_mobile'];
    _totalItems = json['total_items'];
    _paymentStatus = json['payment_status'];
    _paymentMode = json['payment_mode'];
    _pickupTime = json['pickup_time'];
    _pickupDate = json['pickup_date'];
    _pickupAddress = json['pickup_address'];
    _pickupDriver = json['pickup_driver'];
    _dropoffTime = json['dropoff_time'];
    _dropoffDate = json['dropoff_date'];
    _dropoffAddress = json['dropoff_address'];
    _dropoffDriver = json['dropoff_driver'];
    _itemTotal = json['item_total'];
    _deliveryType = json['delivery_type'];
    _cutoffCharge = json['cutoff_charge'];
    _zipcodeDeliveryCharge = json['zipcode_delivery_charge'];
    if (json['order_items'] != null) {
      _orderItems = [];
      json['order_items'].forEach((v) {
        _orderItems.add(Order_items.fromJson(v));
      });
    }
    if (json['order_review'] != null) {
      _orderReview = [];
      json['order_review'].forEach((v) {
        _orderReview.add(Order_review.fromJson(v));
      });
    }
  }
  String _orderStatus;
  String _orderId;
  String _orderDate;
  String _orderType;
  String _totalAmount;
  String _discountAmount;
  String _orderAmount;
  String _taxAmount;
  String _deliveryCharges;
  String _serviceCharge;
  String _totalAddonPrice;
  String _discount;
  String _offerDiscount;
  String _customerName;
  String _customerEmail;
  String _customerMobile;
  int _totalItems;
  String _paymentStatus;
  String _paymentMode;
  String _pickupTime;
  String _pickupDate;
  String _pickupAddress;
  String _pickupDriver;
  String _dropoffTime;
  String _dropoffDate;
  String _dropoffAddress;
  String _dropoffDriver;
  String _itemTotal;
  String _deliveryType;
  String _cutoffCharge;
  String _zipcodeDeliveryCharge;
  List<dynamic> _orderItems;
  List<dynamic> _orderReview;

  String get orderStatus => _orderStatus;
  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderType => _orderType;
  String get totalAmount => _totalAmount;
  String get discountAmount => _discountAmount;
  String get orderAmount => _orderAmount;
  String get taxAmount => _taxAmount;
  String get deliveryCharges => _deliveryCharges;
  String get serviceCharge => _serviceCharge;
  String get totalAddonPrice => _totalAddonPrice;
  String get discount => _discount;
  String get offerDiscount => _offerDiscount;
  String get customerName => _customerName;
  String get customerEmail => _customerEmail;
  String get customerMobile => _customerMobile;
  int get totalItems => _totalItems;
  String get paymentStatus => _paymentStatus;
  String get paymentMode => _paymentMode;
  String get pickupTime => _pickupTime;
  String get pickupDate => _pickupDate;
  String get pickupAddress => _pickupAddress;
  String get pickupDriver => _pickupDriver;
  String get dropoffTime => _dropoffTime;
  String get dropoffDate => _dropoffDate;
  String get dropoffAddress => _dropoffAddress;
  String get dropoffDriver => _dropoffDriver;
  String get itemTotal => _itemTotal;
  String get deliveryType => _deliveryType;
  String get cutoffCharge => _cutoffCharge;
  String get zipcodeDeliveryCharge => _zipcodeDeliveryCharge;
  List<dynamic> get orderItems => _orderItems;
  List<dynamic> get orderReview => _orderReview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_status'] = _orderStatus;
    map['order_id'] = _orderId;
    map['order_date'] = _orderDate;
    map['order_type'] = _orderType;
    map['total_amount'] = _totalAmount;
    map['discount_amount'] = _discountAmount;
    map['order_amount'] = _orderAmount;
    map['tax_amount'] = _taxAmount;
    map['delivery_charges'] = _deliveryCharges;
    map['service_charge'] = _serviceCharge;
    map['total_addon_price'] = _totalAddonPrice;
    map['discount'] = _discount;
    map['item_total'] = _itemTotal;
    map['delivery_type'] = _deliveryType;
    map['cutoff_charge'] = _cutoffCharge;
    map['zipcode_delivery_charge'] = _zipcodeDeliveryCharge;
    map['offer_discount'] = _offerDiscount;
    map['customer_name'] = _customerName;
    map['customer_email'] = _customerEmail;
    map['customer_mobile'] = _customerMobile;
    map['total_items'] = _totalItems;
    map['payment_status'] = _paymentStatus;
    map['payment_mode'] = _paymentMode;
    map['pickup_time'] = _pickupTime;
    map['pickup_date'] = _pickupDate;
    map['pickup_address'] = _pickupAddress;
    map['pickup_driver'] = _pickupDriver;
    map['dropoff_time'] = _dropoffTime;
    map['dropoff_date'] = _dropoffDate;
    map['dropoff_address'] = _dropoffAddress;
    map['dropoff_driver'] = _dropoffDriver;
    if (_orderItems != null) {
      map['order_items'] = _orderItems.map((v) => v.toJson()).toList();
    }
    if (_orderReview != null) {
      map['order_review'] = _orderReview.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

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


/// rating : "4"
/// review : "Test"
/// review_date : "05/18/2021"

class Order_review {
  String _rating;
  String _review;
  String _reviewDate;

  String get rating => _rating;
  String get review => _review;
  String get reviewDate => _reviewDate;

  Order_review({
    String rating,
    String review,
    String reviewDate}){
    _rating = rating;
    _review = review;
    _reviewDate = reviewDate;
  }

  Order_review.fromJson(dynamic json) {
    _rating = json["rating"];
    _review = json["review"];
    _reviewDate = json["review_date"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["rating"] = _rating;
    map["review"] = _review;
    map["review_date"] = _reviewDate;
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