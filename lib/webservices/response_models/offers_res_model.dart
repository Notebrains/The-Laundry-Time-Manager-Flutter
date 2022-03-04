/// status : 1
/// message : "Success"
/// response : {"offers_list":[{"id":"52","validity":"Expired","name":"Wash 2 & Get 1 Wash Free","category":"MEN'S WEAR","subcategory":"CLOTHING","price":"20.00","production_type":"Dry Clean","image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","offer_items":[{"item_name":"BLAZER/JACKET","item_price":"12.00","item_qty":"2","total_price":"24.00","billable_qty":"2","billable_price":"24.00"},{"item_name":"COAT","item_price":"18.00","item_qty":"1","total_price":"18.00","billable_qty":"0","billable_price":"0.00"}],"no_of_customers":3,"customers_details":[{"order_id":"38051781","order_date":"04/26/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"},{"order_id":"54594319","order_date":"04/27/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"},{"order_id":"90094836","order_date":"04/29/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"}]},{"id":"53","validity":"2021-05-25","name":"May coupon code","category":"WOMEN'S WEAR","subcategory":"CLOTHING","price":"30.00","production_type":"Press Only","image":"https://mridayadevstudio.com/tlt_dev/uploads/laundry-tshirt.png","offer_items":[{"item_name":"DRESS","item_price":"5.00","item_qty":"2","total_price":"10.00","billable_qty":"1","billable_price":"5.00"}],"no_of_customers":0,"customers_details":[]}],"vouchers_list":[{"id":"4","code":"859988","how_many_user_can_use":"26","no_of_time_use_by_each":"10","total_useable":"260","total_used_by_customers":"1","discount_type":"Percentage Discount","discount_amount":"100.00","cutoff_amount":"25.00","valid_from":"05/19/2021","valid_to":"06/30/2021","details":"$100 discount on minimum laundry of $300","status":"Active","expiry_status":"Available","customer_details":[{"date":"05/19/2021","order_id":"62193157","name":"Tanay Mitra","mobile":"9173037592"}]}]}

class OffersResModel {
  int _status;
  String _message;
  Response _response;

  int get status => _status;
  String get message => _message;
  Response get response => _response;

  OffersResModel({
      int status, 
      String message, 
      Response response}){
    _status = status;
    _message = message;
    _response = response;
}

  OffersResModel.fromJson(dynamic json) {
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

/// offers_list : [{"id":"52","validity":"Expired","name":"Wash 2 & Get 1 Wash Free","category":"MEN'S WEAR","subcategory":"CLOTHING","price":"20.00","production_type":"Dry Clean","image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","offer_items":[{"item_name":"BLAZER/JACKET","item_price":"12.00","item_qty":"2","total_price":"24.00","billable_qty":"2","billable_price":"24.00"},{"item_name":"COAT","item_price":"18.00","item_qty":"1","total_price":"18.00","billable_qty":"0","billable_price":"0.00"}],"no_of_customers":3,"customers_details":[{"order_id":"38051781","order_date":"04/26/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"},{"order_id":"54594319","order_date":"04/27/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"},{"order_id":"90094836","order_date":"04/29/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"}]},{"id":"53","validity":"2021-05-25","name":"May coupon code","category":"WOMEN'S WEAR","subcategory":"CLOTHING","price":"30.00","production_type":"Press Only","image":"https://mridayadevstudio.com/tlt_dev/uploads/laundry-tshirt.png","offer_items":[{"item_name":"DRESS","item_price":"5.00","item_qty":"2","total_price":"10.00","billable_qty":"1","billable_price":"5.00"}],"no_of_customers":0,"customers_details":[]}]
/// vouchers_list : [{"id":"4","code":"859988","how_many_user_can_use":"26","no_of_time_use_by_each":"10","total_useable":"260","total_used_by_customers":"1","discount_type":"Percentage Discount","discount_amount":"100.00","cutoff_amount":"25.00","valid_from":"05/19/2021","valid_to":"06/30/2021","details":"$100 discount on minimum laundry of $300","status":"Active","expiry_status":"Available","customer_details":[{"date":"05/19/2021","order_id":"62193157","name":"Tanay Mitra","mobile":"9173037592"}]}]

class Response {
  List<Offers_list> _offersList;
  List<Vouchers_list> _vouchersList;

  List<Offers_list> get offersList => _offersList;
  List<Vouchers_list> get vouchersList => _vouchersList;

  Response({
      List<Offers_list> offersList, 
      List<Vouchers_list> vouchersList}){
    _offersList = offersList;
    _vouchersList = vouchersList;
}

  Response.fromJson(dynamic json) {
    if (json["offers_list"] != null) {
      _offersList = [];
      json["offers_list"].forEach((v) {
        _offersList.add(Offers_list.fromJson(v));
      });
    }
    if (json["vouchers_list"] != null) {
      _vouchersList = [];
      json["vouchers_list"].forEach((v) {
        _vouchersList.add(Vouchers_list.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_offersList != null) {
      map["offers_list"] = _offersList.map((v) => v.toJson()).toList();
    }
    if (_vouchersList != null) {
      map["vouchers_list"] = _vouchersList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "4"
/// code : "859988"
/// how_many_user_can_use : "26"
/// no_of_time_use_by_each : "10"
/// total_useable : "260"
/// total_used_by_customers : "1"
/// discount_type : "Percentage Discount"
/// discount_amount : "100.00"
/// cutoff_amount : "25.00"
/// valid_from : "05/19/2021"
/// valid_to : "06/30/2021"
/// details : "$100 discount on minimum laundry of $300"
/// status : "Active"
/// expiry_status : "Available"
/// customer_details : [{"date":"05/19/2021","order_id":"62193157","name":"Tanay Mitra","mobile":"9173037592"}]

class Vouchers_list {
  String _id;
  String _code;
  String _howManyUserCanUse;
  String _noOfTimeUseByEach;
  String _totalUseable;
  String _totalUsedByCustomers;
  String _discountType;
  String _discountAmount;
  String _cutoffAmount;
  String _validFrom;
  String _validTo;
  String _details;
  String _status;
  String _expiryStatus;
  List<Customer_details> _customerDetails;

  String get id => _id;
  String get code => _code;
  String get howManyUserCanUse => _howManyUserCanUse;
  String get noOfTimeUseByEach => _noOfTimeUseByEach;
  String get totalUseable => _totalUseable;
  String get totalUsedByCustomers => _totalUsedByCustomers;
  String get discountType => _discountType;
  String get discountAmount => _discountAmount;
  String get cutoffAmount => _cutoffAmount;
  String get validFrom => _validFrom;
  String get validTo => _validTo;
  String get details => _details;
  String get status => _status;
  String get expiryStatus => _expiryStatus;
  List<Customer_details> get customerDetails => _customerDetails;

  Vouchers_list({
      String id, 
      String code, 
      String howManyUserCanUse, 
      String noOfTimeUseByEach, 
      String totalUseable, 
      String totalUsedByCustomers, 
      String discountType, 
      String discountAmount, 
      String cutoffAmount, 
      String validFrom, 
      String validTo, 
      String details, 
      String status, 
      String expiryStatus, 
      List<Customer_details> customerDetails}){
    _id = id;
    _code = code;
    _howManyUserCanUse = howManyUserCanUse;
    _noOfTimeUseByEach = noOfTimeUseByEach;
    _totalUseable = totalUseable;
    _totalUsedByCustomers = totalUsedByCustomers;
    _discountType = discountType;
    _discountAmount = discountAmount;
    _cutoffAmount = cutoffAmount;
    _validFrom = validFrom;
    _validTo = validTo;
    _details = details;
    _status = status;
    _expiryStatus = expiryStatus;
    _customerDetails = customerDetails;
}

  Vouchers_list.fromJson(dynamic json) {
    _id = json["id"];
    _code = json["code"];
    _howManyUserCanUse = json["how_many_user_can_use"];
    _noOfTimeUseByEach = json["no_of_time_use_by_each"];
    _totalUseable = json["total_useable"];
    _totalUsedByCustomers = json["total_used_by_customers"];
    _discountType = json["discount_type"];
    _discountAmount = json["discount_amount"];
    _cutoffAmount = json["cutoff_amount"];
    _validFrom = json["valid_from"];
    _validTo = json["valid_to"];
    _details = json["details"];
    _status = json["status"];
    _expiryStatus = json["expiry_status"];
    if (json["customer_details"] != null) {
      _customerDetails = [];
      json["customer_details"].forEach((v) {
        _customerDetails.add(Customer_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["code"] = _code;
    map["how_many_user_can_use"] = _howManyUserCanUse;
    map["no_of_time_use_by_each"] = _noOfTimeUseByEach;
    map["total_useable"] = _totalUseable;
    map["total_used_by_customers"] = _totalUsedByCustomers;
    map["discount_type"] = _discountType;
    map["discount_amount"] = _discountAmount;
    map["cutoff_amount"] = _cutoffAmount;
    map["valid_from"] = _validFrom;
    map["valid_to"] = _validTo;
    map["details"] = _details;
    map["status"] = _status;
    map["expiry_status"] = _expiryStatus;
    if (_customerDetails != null) {
      map["customer_details"] = _customerDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "05/19/2021"
/// order_id : "62193157"
/// name : "Tanay Mitra"
/// mobile : "9173037592"

class Customer_details {
  String _date;
  String _orderId;
  String _name;
  String _mobile;
  String _location;

  String get date => _date;
  String get orderId => _orderId;
  String get name => _name;
  String get mobile => _mobile;
  String get location => _location;

  Customer_details({
      String date, 
      String orderId, 
      String name, 
      String mobile,
      String location,
  }){
    _date = date;
    _orderId = orderId;
    _name = name;
    _mobile = mobile;
    _location = location;
}

  Customer_details.fromJson(dynamic json) {
    _date = json["date"];
    _orderId = json["order_id"];
    _name = json["name"];
    _mobile = json["mobile"];
    _location = json["location"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["order_id"] = _orderId;
    map["name"] = _name;
    map["mobile"] = _mobile;
    map["location"] = _location;
    return map;
  }

}

/// id : "52"
/// validity : "Expired"
/// name : "Wash 2 & Get 1 Wash Free"
/// category : "MEN'S WEAR"
/// subcategory : "CLOTHING"
/// price : "20.00"
/// production_type : "Dry Clean"
/// image : "https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg"
/// offer_items : [{"item_name":"BLAZER/JACKET","item_price":"12.00","item_qty":"2","total_price":"24.00","billable_qty":"2","billable_price":"24.00"},{"item_name":"COAT","item_price":"18.00","item_qty":"1","total_price":"18.00","billable_qty":"0","billable_price":"0.00"}]
/// no_of_customers : 3
/// customers_details : [{"order_id":"38051781","order_date":"04/26/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"},{"order_id":"54594319","order_date":"04/27/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"},{"order_id":"90094836","order_date":"04/29/2021","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592"}]

class Offers_list {
  String _id;
  String _validity;
  String _name;
  String _category;
  String _subcategory;
  String _price;
  String _productionType;
  String _image;
  List<Offer_items> _offerItems;
  int _noOfCustomers;
  List<Customers_details> _customersDetails;

  String get id => _id;
  String get validity => _validity;
  String get name => _name;
  String get category => _category;
  String get subcategory => _subcategory;
  String get price => _price;
  String get productionType => _productionType;
  String get image => _image;
  List<Offer_items> get offerItems => _offerItems;
  int get noOfCustomers => _noOfCustomers;
  List<Customers_details> get customersDetails => _customersDetails;

  Offers_list({
      String id, 
      String validity, 
      String name, 
      String category, 
      String subcategory, 
      String price, 
      String productionType, 
      String image, 
      List<Offer_items> offerItems, 
      int noOfCustomers, 
      List<Customers_details> customersDetails}){
    _id = id;
    _validity = validity;
    _name = name;
    _category = category;
    _subcategory = subcategory;
    _price = price;
    _productionType = productionType;
    _image = image;
    _offerItems = offerItems;
    _noOfCustomers = noOfCustomers;
    _customersDetails = customersDetails;
}

  Offers_list.fromJson(dynamic json) {
    _id = json["id"];
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
    _noOfCustomers = json["no_of_customers"];
    if (json["customers_details"] != null) {
      _customersDetails = [];
      json["customers_details"].forEach((v) {
        _customersDetails.add(Customers_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
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
    map["no_of_customers"] = _noOfCustomers;
    if (_customersDetails != null) {
      map["customers_details"] = _customersDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order_id : "38051781"
/// order_date : "04/26/2021"
/// name : "Tanay Mitra"
/// email : "tanay.sit.it@gmail.com"
/// mobile : "9173037592"

class Customers_details {
  String _orderId;
  String _orderDate;
  String _name;
  String _email;
  String _mobile;
  String _location;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;
  String get location => _location;

  Customers_details({
      String orderId, 
      String orderDate, 
      String name, 
      String email, 
      String mobile,
      String location,
  }){
    _orderId = orderId;
    _orderDate = orderDate;
    _name = name;
    _email = email;
    _mobile = mobile;
    _location = location;
}

  Customers_details.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
    _location = json["location"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["name"] = _name;
    map["email"] = _email;
    map["mobile"] = _mobile;
    map["location"] = _location;
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