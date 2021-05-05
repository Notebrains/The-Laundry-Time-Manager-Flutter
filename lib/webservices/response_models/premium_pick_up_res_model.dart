/// status : 1
/// message : "Success"
/// response : {"current":[{"order_id":"38051781","order_date":"26 Apr 2021","order_amount":"88.00","payment_status":"Pending","pickup_date":"27 Apr 2021","pickup_time":"10:00:00-11:00:00","contact_name":"Tanay Mitra","contact_email":"tanay.sit.it@gmail.com","contact_mobile":"9173037592","alter_mobile":"0","house_name":"Test","street":"Tumon","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":"","total_items":2,"premium_current_pickup_item_details":[{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]}],"pending":[{"order_id":"38051781","order_date":"26 Apr 2021","order_amount":"88.00","payment_status":"Pending","pickup_date":"27 Apr 2021","pickup_time":"10:00:00-11:00:00","contact_name":"Tanay Mitra","contact_email":"tanay.sit.it@gmail.com","contact_mobile":"9173037592","alter_mobile":"0","house_name":"Test","street":"Tumon","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":"","total_items":2,"premium_pending_pickup_item_details":[{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]}],"history":[{"order_id":"38051781","order_date":"26 Apr 2021","order_amount":"88.00","payment_status":"Pending","pickup_date":"27 Apr 2021","pickup_time":"10:00:00-11:00:00","contact_name":"Tanay Mitra","contact_email":"tanay.sit.it@gmail.com","contact_mobile":"9173037592","alter_mobile":"0","house_name":"Test","street":"Tumon","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":"","total_items":2,"premium_history_pickup_item_details":[{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]}]}

class PremiumPickUpResModel {
  int _status;
  String _message;
  Response _response;

  int get status => _status;
  String get message => _message;
  Response get response => _response;

  PremiumPickUpResModel({
      int status, 
      String message, 
      Response response}){
    _status = status;
    _message = message;
    _response = response;
}

  PremiumPickUpResModel.fromJson(dynamic json) {
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

/// current : [{"order_id":"38051781","order_date":"26 Apr 2021","order_amount":"88.00","payment_status":"Pending","pickup_date":"27 Apr 2021","pickup_time":"10:00:00-11:00:00","contact_name":"Tanay Mitra","contact_email":"tanay.sit.it@gmail.com","contact_mobile":"9173037592","alter_mobile":"0","house_name":"Test","street":"Tumon","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":"","total_items":2,"premium_current_pickup_item_details":[{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]}]
/// pending : [{"order_id":"38051781","order_date":"26 Apr 2021","order_amount":"88.00","payment_status":"Pending","pickup_date":"27 Apr 2021","pickup_time":"10:00:00-11:00:00","contact_name":"Tanay Mitra","contact_email":"tanay.sit.it@gmail.com","contact_mobile":"9173037592","alter_mobile":"0","house_name":"Test","street":"Tumon","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":"","total_items":2,"premium_pending_pickup_item_details":[{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]}]
/// history : [{"order_id":"38051781","order_date":"26 Apr 2021","order_amount":"88.00","payment_status":"Pending","pickup_date":"27 Apr 2021","pickup_time":"10:00:00-11:00:00","contact_name":"Tanay Mitra","contact_email":"tanay.sit.it@gmail.com","contact_mobile":"9173037592","alter_mobile":"0","house_name":"Test","street":"Tumon","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":"","total_items":2,"premium_history_pickup_item_details":[{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]}]

class Response {
  List<Current> _current;
  List<Pending> _pending;
  List<History> _history;

  List<Current> get current => _current;
  List<Pending> get pending => _pending;
  List<History> get history => _history;

  Response({
      List<Current> current, 
      List<Pending> pending, 
      List<History> history}){
    _current = current;
    _pending = pending;
    _history = history;
}

  Response.fromJson(dynamic json) {
    if (json["current"] != null) {
      _current = [];
      json["current"].forEach((v) {
        _current.add(Current.fromJson(v));
      });
    }
    if (json["pending"] != null) {
      _pending = [];
      json["pending"].forEach((v) {
        _pending.add(Pending.fromJson(v));
      });
    }
    if (json["history"] != null) {
      _history = [];
      json["history"].forEach((v) {
        _history.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_current != null) {
      map["current"] = _current.map((v) => v.toJson()).toList();
    }
    if (_pending != null) {
      map["pending"] = _pending.map((v) => v.toJson()).toList();
    }
    if (_history != null) {
      map["history"] = _history.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order_id : "38051781"
/// order_date : "26 Apr 2021"
/// order_amount : "88.00"
/// payment_status : "Pending"
/// pickup_date : "27 Apr 2021"
/// pickup_time : "10:00:00-11:00:00"
/// contact_name : "Tanay Mitra"
/// contact_email : "tanay.sit.it@gmail.com"
/// contact_mobile : "9173037592"
/// alter_mobile : "0"
/// house_name : "Test"
/// street : "Tumon"
/// city : "GUAM"
/// state : "GUAM"
/// country : "USA"
/// zip_code : "96913"
/// landmark : ""
/// additional_info : ""
/// total_items : 2
/// premium_history_pickup_item_details : [{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]

class History {
  String _orderId;
  String _orderDate;
  String _orderAmount;
  String _paymentStatus;
  String _pickupDate;
  String _pickupTime;
  String _contactName;
  String _contactEmail;
  String _contactMobile;
  String _alterMobile;
  String _houseName;
  String _street;
  String _city;
  String _state;
  String _country;
  String _zipCode;
  String _landmark;
  String _additionalInfo;
  int _totalItems;
  List<Premium_history_pickup_item_details> _premiumHistoryPickupItemDetails;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderAmount => _orderAmount;
  String get paymentStatus => _paymentStatus;
  String get pickupDate => _pickupDate;
  String get pickupTime => _pickupTime;
  String get contactName => _contactName;
  String get contactEmail => _contactEmail;
  String get contactMobile => _contactMobile;
  String get alterMobile => _alterMobile;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipCode => _zipCode;
  String get landmark => _landmark;
  String get additionalInfo => _additionalInfo;
  int get totalItems => _totalItems;
  List<Premium_history_pickup_item_details> get premiumHistoryPickupItemDetails => _premiumHistoryPickupItemDetails;

  History({
      String orderId, 
      String orderDate, 
      String orderAmount, 
      String paymentStatus, 
      String pickupDate, 
      String pickupTime, 
      String contactName, 
      String contactEmail, 
      String contactMobile, 
      String alterMobile, 
      String houseName, 
      String street, 
      String city, 
      String state, 
      String country, 
      String zipCode, 
      String landmark, 
      String additionalInfo, 
      int totalItems, 
      List<Premium_history_pickup_item_details> premiumHistoryPickupItemDetails}){
    _orderId = orderId;
    _orderDate = orderDate;
    _orderAmount = orderAmount;
    _paymentStatus = paymentStatus;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _contactName = contactName;
    _contactEmail = contactEmail;
    _contactMobile = contactMobile;
    _alterMobile = alterMobile;
    _houseName = houseName;
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipCode = zipCode;
    _landmark = landmark;
    _additionalInfo = additionalInfo;
    _totalItems = totalItems;
    _premiumHistoryPickupItemDetails = premiumHistoryPickupItemDetails;
}

  History.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _orderAmount = json["order_amount"];
    _paymentStatus = json["payment_status"];
    _pickupDate = json["pickup_date"];
    _pickupTime = json["pickup_time"];
    _contactName = json["contact_name"];
    _contactEmail = json["contact_email"];
    _contactMobile = json["contact_mobile"];
    _alterMobile = json["alter_mobile"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _zipCode = json["zip_code"];
    _landmark = json["landmark"];
    _additionalInfo = json["additional_info"];
    _totalItems = json["total_items"];
    if (json["premium_history_pickup_item_details"] != null) {
      _premiumHistoryPickupItemDetails = [];
      json["premium_history_pickup_item_details"].forEach((v) {
        _premiumHistoryPickupItemDetails.add(Premium_history_pickup_item_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["order_amount"] = _orderAmount;
    map["payment_status"] = _paymentStatus;
    map["pickup_date"] = _pickupDate;
    map["pickup_time"] = _pickupTime;
    map["contact_name"] = _contactName;
    map["contact_email"] = _contactEmail;
    map["contact_mobile"] = _contactMobile;
    map["alter_mobile"] = _alterMobile;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    map["zip_code"] = _zipCode;
    map["landmark"] = _landmark;
    map["additional_info"] = _additionalInfo;
    map["total_items"] = _totalItems;
    if (_premiumHistoryPickupItemDetails != null) {
      map["premium_history_pickup_item_details"] = _premiumHistoryPickupItemDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_id : "52"
/// item_for : "Offer"
/// item_name : "Wash 2 & Get 1 Wash Free"
/// item_qty : "2"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg"
/// category : "MEN'S WEAR"
/// item_price : "20.00"
/// offer_items : [{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]

class Premium_history_pickup_item_details {
  String _itemId;
  String _itemFor;
  String _itemName;
  String _itemQty;
  String _itemImage;
  String _category;
  String _itemPrice;
  List<Offer_items> _offerItems;

  String get itemId => _itemId;
  String get itemFor => _itemFor;
  String get itemName => _itemName;
  String get itemQty => _itemQty;
  String get itemImage => _itemImage;
  String get category => _category;
  String get itemPrice => _itemPrice;
  List<Offer_items> get offerItems => _offerItems;

  Premium_history_pickup_item_details({
      String itemId, 
      String itemFor, 
      String itemName, 
      String itemQty, 
      String itemImage, 
      String category, 
      String itemPrice, 
      List<Offer_items> offerItems}){
    _itemId = itemId;
    _itemFor = itemFor;
    _itemName = itemName;
    _itemQty = itemQty;
    _itemImage = itemImage;
    _category = category;
    _itemPrice = itemPrice;
    _offerItems = offerItems;
}

  Premium_history_pickup_item_details.fromJson(dynamic json) {
    _itemId = json["item_id"];
    _itemFor = json["item_for"];
    _itemName = json["item_name"];
    _itemQty = json["item_qty"];
    _itemImage = json["item_image"];
    _category = json["category"];
    _itemPrice = json["item_price"];
    if (json["offer_items"] != null) {
      _offerItems = [];
      json["offer_items"].forEach((v) {
        _offerItems.add(Offer_items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_id"] = _itemId;
    map["item_for"] = _itemFor;
    map["item_name"] = _itemName;
    map["item_qty"] = _itemQty;
    map["item_image"] = _itemImage;
    map["category"] = _category;
    map["item_price"] = _itemPrice;
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
  String _nonOfferItemCategory;
  String _nonOfferItemPrice;
  String _nonOfferItemId;

  String get itemName => _itemName;
  String get itemQty => _itemQty;
  String get itemImage => _itemImage;
  String get nonOfferItemCategory => _nonOfferItemCategory;
  String get nonOfferItemPrice => _nonOfferItemPrice;
  String get nonOfferItemId => _nonOfferItemId;

  Offer_items({
      String itemName, 
      String itemQty, 
      String itemImage,
      String nonOfferItemCategory,
      String nonOfferItemPrice,
      String nonOfferItemId,
  }){
    _itemName = itemName;
    _itemQty = itemQty;
    _itemImage = itemImage;
    _nonOfferItemCategory = nonOfferItemCategory;
    _nonOfferItemPrice = nonOfferItemPrice;
    _nonOfferItemId = nonOfferItemId;
}

  Offer_items.fromJson(dynamic json) {
    _itemName = json["item_name"];
    _itemQty = json["item_qty"];
    _itemImage = json["item_image"];
    _nonOfferItemCategory = json["non_offer_item_category"];
    _nonOfferItemPrice = json["non_offer_item_price"];
    _nonOfferItemId = json["non_offer_item_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_name"] = _itemName;
    map["item_qty"] = _itemQty;
    map["item_image"] = _itemImage;
    map["non_offer_item_category"] = _nonOfferItemCategory;
    map["non_offer_item_price"] = _nonOfferItemPrice;
    map["non_offer_item_id"] = _nonOfferItemId;
    return map;
  }

}

/// order_id : "38051781"
/// order_date : "26 Apr 2021"
/// order_amount : "88.00"
/// payment_status : "Pending"
/// pickup_date : "27 Apr 2021"
/// pickup_time : "10:00:00-11:00:00"
/// contact_name : "Tanay Mitra"
/// contact_email : "tanay.sit.it@gmail.com"
/// contact_mobile : "9173037592"
/// alter_mobile : "0"
/// house_name : "Test"
/// street : "Tumon"
/// city : "GUAM"
/// state : "GUAM"
/// country : "USA"
/// zip_code : "96913"
/// landmark : ""
/// additional_info : ""
/// total_items : 2
/// premium_pending_pickup_item_details : [{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]

class Pending {
  String _orderId;
  String _orderDate;
  String _orderAmount;
  String _paymentStatus;
  String _pickupDate;
  String _pickupTime;
  String _contactName;
  String _contactEmail;
  String _contactMobile;
  String _alterMobile;
  String _houseName;
  String _street;
  String _city;
  String _state;
  String _country;
  String _zipCode;
  String _landmark;
  String _additionalInfo;
  int _totalItems;
  List<Premium_pending_pickup_item_details> _premiumPendingPickupItemDetails;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderAmount => _orderAmount;
  String get paymentStatus => _paymentStatus;
  String get pickupDate => _pickupDate;
  String get pickupTime => _pickupTime;
  String get contactName => _contactName;
  String get contactEmail => _contactEmail;
  String get contactMobile => _contactMobile;
  String get alterMobile => _alterMobile;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipCode => _zipCode;
  String get landmark => _landmark;
  String get additionalInfo => _additionalInfo;
  int get totalItems => _totalItems;
  List<Premium_pending_pickup_item_details> get premiumPendingPickupItemDetails => _premiumPendingPickupItemDetails;

  Pending({
      String orderId, 
      String orderDate, 
      String orderAmount, 
      String paymentStatus, 
      String pickupDate, 
      String pickupTime, 
      String contactName, 
      String contactEmail, 
      String contactMobile, 
      String alterMobile, 
      String houseName, 
      String street, 
      String city, 
      String state, 
      String country, 
      String zipCode, 
      String landmark, 
      String additionalInfo, 
      int totalItems, 
      List<Premium_pending_pickup_item_details> premiumPendingPickupItemDetails}){
    _orderId = orderId;
    _orderDate = orderDate;
    _orderAmount = orderAmount;
    _paymentStatus = paymentStatus;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _contactName = contactName;
    _contactEmail = contactEmail;
    _contactMobile = contactMobile;
    _alterMobile = alterMobile;
    _houseName = houseName;
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipCode = zipCode;
    _landmark = landmark;
    _additionalInfo = additionalInfo;
    _totalItems = totalItems;
    _premiumPendingPickupItemDetails = premiumPendingPickupItemDetails;
}

  Pending.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _orderAmount = json["order_amount"];
    _paymentStatus = json["payment_status"];
    _pickupDate = json["pickup_date"];
    _pickupTime = json["pickup_time"];
    _contactName = json["contact_name"];
    _contactEmail = json["contact_email"];
    _contactMobile = json["contact_mobile"];
    _alterMobile = json["alter_mobile"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _zipCode = json["zip_code"];
    _landmark = json["landmark"];
    _additionalInfo = json["additional_info"];
    _totalItems = json["total_items"];
    if (json["premium_pending_pickup_item_details"] != null) {
      _premiumPendingPickupItemDetails = [];
      json["premium_pending_pickup_item_details"].forEach((v) {
        _premiumPendingPickupItemDetails.add(Premium_pending_pickup_item_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["order_amount"] = _orderAmount;
    map["payment_status"] = _paymentStatus;
    map["pickup_date"] = _pickupDate;
    map["pickup_time"] = _pickupTime;
    map["contact_name"] = _contactName;
    map["contact_email"] = _contactEmail;
    map["contact_mobile"] = _contactMobile;
    map["alter_mobile"] = _alterMobile;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    map["zip_code"] = _zipCode;
    map["landmark"] = _landmark;
    map["additional_info"] = _additionalInfo;
    map["total_items"] = _totalItems;
    if (_premiumPendingPickupItemDetails != null) {
      map["premium_pending_pickup_item_details"] = _premiumPendingPickupItemDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_id : "52"
/// item_for : "Offer"
/// item_name : "Wash 2 & Get 1 Wash Free"
/// item_qty : "2"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg"
/// category : "MEN'S WEAR"
/// item_price : "20.00"
/// offer_items : [{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]

class Premium_pending_pickup_item_details {
  String _itemId;
  String _itemFor;
  String _itemName;
  String _itemQty;
  String _itemImage;
  String _category;
  String _itemPrice;
  List<Offer_items> _offerItems;

  String get itemId => _itemId;
  String get itemFor => _itemFor;
  String get itemName => _itemName;
  String get itemQty => _itemQty;
  String get itemImage => _itemImage;
  String get category => _category;
  String get itemPrice => _itemPrice;
  List<Offer_items> get offerItems => _offerItems;

  Premium_pending_pickup_item_details({
      String itemId, 
      String itemFor, 
      String itemName, 
      String itemQty, 
      String itemImage, 
      String category, 
      String itemPrice, 
      List<Offer_items> offerItems}){
    _itemId = itemId;
    _itemFor = itemFor;
    _itemName = itemName;
    _itemQty = itemQty;
    _itemImage = itemImage;
    _category = category;
    _itemPrice = itemPrice;
    _offerItems = offerItems;
}

  Premium_pending_pickup_item_details.fromJson(dynamic json) {
    _itemId = json["item_id"];
    _itemFor = json["item_for"];
    _itemName = json["item_name"];
    _itemQty = json["item_qty"];
    _itemImage = json["item_image"];
    _category = json["category"];
    _itemPrice = json["item_price"];
    if (json["offer_items"] != null) {
      _offerItems = [];
      json["offer_items"].forEach((v) {
        _offerItems.add(Offer_items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_id"] = _itemId;
    map["item_for"] = _itemFor;
    map["item_name"] = _itemName;
    map["item_qty"] = _itemQty;
    map["item_image"] = _itemImage;
    map["category"] = _category;
    map["item_price"] = _itemPrice;
    if (_offerItems != null) {
      map["offer_items"] = _offerItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



/// order_id : "38051781"
/// order_date : "26 Apr 2021"
/// order_amount : "88.00"
/// payment_status : "Pending"
/// pickup_date : "27 Apr 2021"
/// pickup_time : "10:00:00-11:00:00"
/// contact_name : "Tanay Mitra"
/// contact_email : "tanay.sit.it@gmail.com"
/// contact_mobile : "9173037592"
/// alter_mobile : "0"
/// house_name : "Test"
/// street : "Tumon"
/// city : "GUAM"
/// state : "GUAM"
/// country : "USA"
/// zip_code : "96913"
/// landmark : ""
/// additional_info : ""
/// total_items : 2
/// premium_current_pickup_item_details : [{"item_id":"52","item_for":"Offer","item_name":"Wash 2 & Get 1 Wash Free","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg","category":"MEN'S WEAR","item_price":"20.00","offer_items":[{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]},{"item_id":"4","item_for":"Non Offer","item_name":"BLAZER/JACKET","item_qty":"4","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png","category":"MEN'S WEAR","item_price":"12.00","offer_items":[]}]

class Current {
  String _orderId;
  String _orderDate;
  String _orderAmount;
  String _paymentStatus;
  String _pickupDate;
  String _pickupTime;
  String _contactName;
  String _contactEmail;
  String _contactMobile;
  String _alterMobile;
  String _houseName;
  String _street;
  String _city;
  String _state;
  String _country;
  String _zipCode;
  String _landmark;
  String _additionalInfo;
  int _totalItems;
  List<Premium_current_pickup_item_details> _premiumCurrentPickupItemDetails;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get orderAmount => _orderAmount;
  String get paymentStatus => _paymentStatus;
  String get pickupDate => _pickupDate;
  String get pickupTime => _pickupTime;
  String get contactName => _contactName;
  String get contactEmail => _contactEmail;
  String get contactMobile => _contactMobile;
  String get alterMobile => _alterMobile;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipCode => _zipCode;
  String get landmark => _landmark;
  String get additionalInfo => _additionalInfo;
  int get totalItems => _totalItems;
  List<Premium_current_pickup_item_details> get premiumCurrentPickupItemDetails => _premiumCurrentPickupItemDetails;

  Current({
      String orderId, 
      String orderDate, 
      String orderAmount, 
      String paymentStatus, 
      String pickupDate, 
      String pickupTime, 
      String contactName, 
      String contactEmail, 
      String contactMobile, 
      String alterMobile, 
      String houseName, 
      String street, 
      String city, 
      String state, 
      String country, 
      String zipCode, 
      String landmark, 
      String additionalInfo, 
      int totalItems, 
      List<Premium_current_pickup_item_details> premiumCurrentPickupItemDetails}){
    _orderId = orderId;
    _orderDate = orderDate;
    _orderAmount = orderAmount;
    _paymentStatus = paymentStatus;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _contactName = contactName;
    _contactEmail = contactEmail;
    _contactMobile = contactMobile;
    _alterMobile = alterMobile;
    _houseName = houseName;
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipCode = zipCode;
    _landmark = landmark;
    _additionalInfo = additionalInfo;
    _totalItems = totalItems;
    _premiumCurrentPickupItemDetails = premiumCurrentPickupItemDetails;
}

  Current.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _orderAmount = json["order_amount"];
    _paymentStatus = json["payment_status"];
    _pickupDate = json["pickup_date"];
    _pickupTime = json["pickup_time"];
    _contactName = json["contact_name"];
    _contactEmail = json["contact_email"];
    _contactMobile = json["contact_mobile"];
    _alterMobile = json["alter_mobile"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _zipCode = json["zip_code"];
    _landmark = json["landmark"];
    _additionalInfo = json["additional_info"];
    _totalItems = json["total_items"];
    if (json["premium_current_pickup_item_details"] != null) {
      _premiumCurrentPickupItemDetails = [];
      json["premium_current_pickup_item_details"].forEach((v) {
        _premiumCurrentPickupItemDetails.add(Premium_current_pickup_item_details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["order_amount"] = _orderAmount;
    map["payment_status"] = _paymentStatus;
    map["pickup_date"] = _pickupDate;
    map["pickup_time"] = _pickupTime;
    map["contact_name"] = _contactName;
    map["contact_email"] = _contactEmail;
    map["contact_mobile"] = _contactMobile;
    map["alter_mobile"] = _alterMobile;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    map["zip_code"] = _zipCode;
    map["landmark"] = _landmark;
    map["additional_info"] = _additionalInfo;
    map["total_items"] = _totalItems;
    if (_premiumCurrentPickupItemDetails != null) {
      map["premium_current_pickup_item_details"] = _premiumCurrentPickupItemDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// item_id : "52"
/// item_for : "Offer"
/// item_name : "Wash 2 & Get 1 Wash Free"
/// item_qty : "2"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/demo_image.jpg"
/// category : "MEN'S WEAR"
/// item_price : "20.00"
/// offer_items : [{"item_name":"BLAZER/JACKET","item_qty":"2","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"},{"item_name":"COAT","item_qty":"1","item_image":"https://mridayadevstudio.com/tlt_dev/uploads/coat.png"}]

class Premium_current_pickup_item_details {
  String _itemId;
  String _itemFor;
  String _itemName;
  String _itemQty;
  String _itemImage;
  String _category;
  String _itemPrice;
  List<Offer_items> _offerItems;

  String get itemId => _itemId;
  String get itemFor => _itemFor;
  String get itemName => _itemName;
  String get itemQty => _itemQty;
  String get itemImage => _itemImage;
  String get category => _category;
  String get itemPrice => _itemPrice;
  List<Offer_items> get offerItems => _offerItems;

  Premium_current_pickup_item_details({
      String itemId, 
      String itemFor, 
      String itemName, 
      String itemQty, 
      String itemImage, 
      String category, 
      String itemPrice, 
      List<Offer_items> offerItems}){
    _itemId = itemId;
    _itemFor = itemFor;
    _itemName = itemName;
    _itemQty = itemQty;
    _itemImage = itemImage;
    _category = category;
    _itemPrice = itemPrice;
    _offerItems = offerItems;
}

  Premium_current_pickup_item_details.fromJson(dynamic json) {
    _itemId = json["item_id"];
    _itemFor = json["item_for"];
    _itemName = json["item_name"];
    _itemQty = json["item_qty"];
    _itemImage = json["item_image"];
    _category = json["category"];
    _itemPrice = json["item_price"];
    if (json["offer_items"] != null) {
      _offerItems = [];
      json["offer_items"].forEach((v) {
        _offerItems.add(Offer_items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_id"] = _itemId;
    map["item_for"] = _itemFor;
    map["item_name"] = _itemName;
    map["item_qty"] = _itemQty;
    map["item_image"] = _itemImage;
    map["category"] = _category;
    map["item_price"] = _itemPrice;
    if (_offerItems != null) {
      map["offer_items"] = _offerItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
