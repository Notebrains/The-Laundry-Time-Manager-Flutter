/// status : 1
/// message : "Success"
/// response : {"current":[{"order_id":"32327576","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"12:00-13:00","bulk_charge_per_pound":"5.00","estimate_weight":"50","total_bulk_charge":"250.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"25.00","service_charge":"0.00","total_payable":"275.00","estimate_charge":"275.00","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""}],"pending":[{"order_id":"34702866","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"12:00-13:00","bulk_charge_per_pound":"5.00","estimate_weight":"25","total_bulk_charge":"125.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"12.50","service_charge":"0.00","total_payable":"137.50","estimate_charge":"137.50","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""},{"order_id":"76801319","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"12:00-13:00","bulk_charge_per_pound":"5.00","estimate_weight":"125","total_bulk_charge":"625.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"0.00","service_charge":"0.00","total_payable":"625.00","estimate_charge":"625.00","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""}],"history":[{"order_id":"98076704","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"10:00-11:00","bulk_charge_per_pound":"5.00","estimate_weight":"4","total_bulk_charge":"275.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"0.00","service_charge":"0.00","total_payable":"275.00","estimate_charge":"42.00","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""}]}

class BulkPickUpResModel {
  int _status;
  String _message;
  Response _response;

  int get status => _status;
  String get message => _message;
  Response get response => _response;

  BulkPickUpResModel({
      int status, 
      String message, 
      Response response}){
    _status = status;
    _message = message;
    _response = response;
}

  BulkPickUpResModel.fromJson(dynamic json) {
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

/// current : [{"order_id":"32327576","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"12:00-13:00","bulk_charge_per_pound":"5.00","estimate_weight":"50","total_bulk_charge":"250.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"25.00","service_charge":"0.00","total_payable":"275.00","estimate_charge":"275.00","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""}]
/// pending : [{"order_id":"34702866","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"12:00-13:00","bulk_charge_per_pound":"5.00","estimate_weight":"25","total_bulk_charge":"125.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"12.50","service_charge":"0.00","total_payable":"137.50","estimate_charge":"137.50","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""},{"order_id":"76801319","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"12:00-13:00","bulk_charge_per_pound":"5.00","estimate_weight":"125","total_bulk_charge":"625.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"0.00","service_charge":"0.00","total_payable":"625.00","estimate_charge":"625.00","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""}]
/// history : [{"order_id":"98076704","order_date":"16 Apr 2021","payment_status":"Pending","pickup_date":"17 Apr 2021","pickup_time":"10:00-11:00","bulk_charge_per_pound":"5.00","estimate_weight":"4","total_bulk_charge":"275.00","bulk_cutoff_charge":"0.00","tax_amount":"0.00","delivery_charges":"0.00","service_charge":"0.00","total_payable":"275.00","estimate_charge":"42.00","contact_name":"Shovan Namdi","contact_email":"shovannandi95@gmail.com","contact_mobile":"8348338409","alter_mobile":"0","house_no":"12","house_name":"Nandi Vila","street":"","city":"GUAM","state":"GUAM","country":"USA","zip_code":"96913","landmark":"","additional_info":""}]

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

/// order_id : "98076704"
/// order_date : "16 Apr 2021"
/// payment_status : "Pending"
/// pickup_date : "17 Apr 2021"
/// pickup_time : "10:00-11:00"
/// bulk_charge_per_pound : "5.00"
/// estimate_weight : "4"
/// total_bulk_charge : "275.00"
/// bulk_cutoff_charge : "0.00"
/// tax_amount : "0.00"
/// delivery_charges : "0.00"
/// service_charge : "0.00"
/// total_payable : "275.00"
/// estimate_charge : "42.00"
/// contact_name : "Shovan Namdi"
/// contact_email : "shovannandi95@gmail.com"
/// contact_mobile : "8348338409"
/// alter_mobile : "0"
/// house_no : "12"
/// house_name : "Nandi Vila"
/// street : ""
/// city : "GUAM"
/// state : "GUAM"
/// country : "USA"
/// zip_code : "96913"
/// landmark : ""
/// additional_info : ""

class History {
  String _orderId;
  String _orderDate;
  String _paymentStatus;
  String _pickupDate;
  String _pickupTime;
  String _bulkChargePerPound;
  String _estimateWeight;
  String _totalBulkCharge;
  String _bulkCutoffCharge;
  String _taxAmount;
  String _deliveryCharges;
  String _serviceCharge;
  String _totalPayable;
  String _estimateCharge;
  String _contactName;
  String _contactEmail;
  String _contactMobile;
  String _alterMobile;
  String _houseNo;
  String _houseName;
  String _street;
  String _city;
  String _state;
  String _country;
  String _zipCode;
  String _landmark;
  String _additionalInfo;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get paymentStatus => _paymentStatus;
  String get pickupDate => _pickupDate;
  String get pickupTime => _pickupTime;
  String get bulkChargePerPound => _bulkChargePerPound;
  String get estimateWeight => _estimateWeight;
  String get totalBulkCharge => _totalBulkCharge;
  String get bulkCutoffCharge => _bulkCutoffCharge;
  String get taxAmount => _taxAmount;
  String get deliveryCharges => _deliveryCharges;
  String get serviceCharge => _serviceCharge;
  String get totalPayable => _totalPayable;
  String get estimateCharge => _estimateCharge;
  String get contactName => _contactName;
  String get contactEmail => _contactEmail;
  String get contactMobile => _contactMobile;
  String get alterMobile => _alterMobile;
  String get houseNo => _houseNo;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipCode => _zipCode;
  String get landmark => _landmark;
  String get additionalInfo => _additionalInfo;

  History({
      String orderId, 
      String orderDate, 
      String paymentStatus, 
      String pickupDate, 
      String pickupTime, 
      String bulkChargePerPound, 
      String estimateWeight, 
      String totalBulkCharge, 
      String bulkCutoffCharge, 
      String taxAmount, 
      String deliveryCharges, 
      String serviceCharge, 
      String totalPayable, 
      String estimateCharge, 
      String contactName, 
      String contactEmail, 
      String contactMobile, 
      String alterMobile, 
      String houseNo, 
      String houseName, 
      String street, 
      String city, 
      String state, 
      String country, 
      String zipCode, 
      String landmark, 
      String additionalInfo}){
    _orderId = orderId;
    _orderDate = orderDate;
    _paymentStatus = paymentStatus;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _bulkChargePerPound = bulkChargePerPound;
    _estimateWeight = estimateWeight;
    _totalBulkCharge = totalBulkCharge;
    _bulkCutoffCharge = bulkCutoffCharge;
    _taxAmount = taxAmount;
    _deliveryCharges = deliveryCharges;
    _serviceCharge = serviceCharge;
    _totalPayable = totalPayable;
    _estimateCharge = estimateCharge;
    _contactName = contactName;
    _contactEmail = contactEmail;
    _contactMobile = contactMobile;
    _alterMobile = alterMobile;
    _houseNo = houseNo;
    _houseName = houseName;
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipCode = zipCode;
    _landmark = landmark;
    _additionalInfo = additionalInfo;
}

  History.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _paymentStatus = json["payment_status"];
    _pickupDate = json["pickup_date"];
    _pickupTime = json["pickup_time"];
    _bulkChargePerPound = json["bulk_charge_per_pound"];
    _estimateWeight = json["estimate_weight"];
    _totalBulkCharge = json["total_bulk_charge"];
    _bulkCutoffCharge = json["bulk_cutoff_charge"];
    _taxAmount = json["tax_amount"];
    _deliveryCharges = json["delivery_charges"];
    _serviceCharge = json["service_charge"];
    _totalPayable = json["total_payable"];
    _estimateCharge = json["estimate_charge"];
    _contactName = json["contact_name"];
    _contactEmail = json["contact_email"];
    _contactMobile = json["contact_mobile"];
    _alterMobile = json["alter_mobile"];
    _houseNo = json["house_no"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _zipCode = json["zip_code"];
    _landmark = json["landmark"];
    _additionalInfo = json["additional_info"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["payment_status"] = _paymentStatus;
    map["pickup_date"] = _pickupDate;
    map["pickup_time"] = _pickupTime;
    map["bulk_charge_per_pound"] = _bulkChargePerPound;
    map["estimate_weight"] = _estimateWeight;
    map["total_bulk_charge"] = _totalBulkCharge;
    map["bulk_cutoff_charge"] = _bulkCutoffCharge;
    map["tax_amount"] = _taxAmount;
    map["delivery_charges"] = _deliveryCharges;
    map["service_charge"] = _serviceCharge;
    map["total_payable"] = _totalPayable;
    map["estimate_charge"] = _estimateCharge;
    map["contact_name"] = _contactName;
    map["contact_email"] = _contactEmail;
    map["contact_mobile"] = _contactMobile;
    map["alter_mobile"] = _alterMobile;
    map["house_no"] = _houseNo;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    map["zip_code"] = _zipCode;
    map["landmark"] = _landmark;
    map["additional_info"] = _additionalInfo;
    return map;
  }

}

/// order_id : "34702866"
/// order_date : "16 Apr 2021"
/// payment_status : "Pending"
/// pickup_date : "17 Apr 2021"
/// pickup_time : "12:00-13:00"
/// bulk_charge_per_pound : "5.00"
/// estimate_weight : "25"
/// total_bulk_charge : "125.00"
/// bulk_cutoff_charge : "0.00"
/// tax_amount : "0.00"
/// delivery_charges : "12.50"
/// service_charge : "0.00"
/// total_payable : "137.50"
/// estimate_charge : "137.50"
/// contact_name : "Shovan Namdi"
/// contact_email : "shovannandi95@gmail.com"
/// contact_mobile : "8348338409"
/// alter_mobile : "0"
/// house_no : "12"
/// house_name : "Nandi Vila"
/// street : ""
/// city : "GUAM"
/// state : "GUAM"
/// country : "USA"
/// zip_code : "96913"
/// landmark : ""
/// additional_info : ""

class Pending {
  String _orderId;
  String _orderDate;
  String _paymentStatus;
  String _pickupDate;
  String _pickupTime;
  String _bulkChargePerPound;
  String _estimateWeight;
  String _totalBulkCharge;
  String _bulkCutoffCharge;
  String _taxAmount;
  String _deliveryCharges;
  String _serviceCharge;
  String _totalPayable;
  String _estimateCharge;
  String _contactName;
  String _contactEmail;
  String _contactMobile;
  String _alterMobile;
  String _houseNo;
  String _houseName;
  String _street;
  String _city;
  String _state;
  String _country;
  String _zipCode;
  String _landmark;
  String _additionalInfo;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get paymentStatus => _paymentStatus;
  String get pickupDate => _pickupDate;
  String get pickupTime => _pickupTime;
  String get bulkChargePerPound => _bulkChargePerPound;
  String get estimateWeight => _estimateWeight;
  String get totalBulkCharge => _totalBulkCharge;
  String get bulkCutoffCharge => _bulkCutoffCharge;
  String get taxAmount => _taxAmount;
  String get deliveryCharges => _deliveryCharges;
  String get serviceCharge => _serviceCharge;
  String get totalPayable => _totalPayable;
  String get estimateCharge => _estimateCharge;
  String get contactName => _contactName;
  String get contactEmail => _contactEmail;
  String get contactMobile => _contactMobile;
  String get alterMobile => _alterMobile;
  String get houseNo => _houseNo;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipCode => _zipCode;
  String get landmark => _landmark;
  String get additionalInfo => _additionalInfo;

  Pending({
      String orderId, 
      String orderDate, 
      String paymentStatus, 
      String pickupDate, 
      String pickupTime, 
      String bulkChargePerPound, 
      String estimateWeight, 
      String totalBulkCharge, 
      String bulkCutoffCharge, 
      String taxAmount, 
      String deliveryCharges, 
      String serviceCharge, 
      String totalPayable, 
      String estimateCharge, 
      String contactName, 
      String contactEmail, 
      String contactMobile, 
      String alterMobile, 
      String houseNo, 
      String houseName, 
      String street, 
      String city, 
      String state, 
      String country, 
      String zipCode, 
      String landmark, 
      String additionalInfo}){
    _orderId = orderId;
    _orderDate = orderDate;
    _paymentStatus = paymentStatus;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _bulkChargePerPound = bulkChargePerPound;
    _estimateWeight = estimateWeight;
    _totalBulkCharge = totalBulkCharge;
    _bulkCutoffCharge = bulkCutoffCharge;
    _taxAmount = taxAmount;
    _deliveryCharges = deliveryCharges;
    _serviceCharge = serviceCharge;
    _totalPayable = totalPayable;
    _estimateCharge = estimateCharge;
    _contactName = contactName;
    _contactEmail = contactEmail;
    _contactMobile = contactMobile;
    _alterMobile = alterMobile;
    _houseNo = houseNo;
    _houseName = houseName;
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipCode = zipCode;
    _landmark = landmark;
    _additionalInfo = additionalInfo;
}

  Pending.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _paymentStatus = json["payment_status"];
    _pickupDate = json["pickup_date"];
    _pickupTime = json["pickup_time"];
    _bulkChargePerPound = json["bulk_charge_per_pound"];
    _estimateWeight = json["estimate_weight"];
    _totalBulkCharge = json["total_bulk_charge"];
    _bulkCutoffCharge = json["bulk_cutoff_charge"];
    _taxAmount = json["tax_amount"];
    _deliveryCharges = json["delivery_charges"];
    _serviceCharge = json["service_charge"];
    _totalPayable = json["total_payable"];
    _estimateCharge = json["estimate_charge"];
    _contactName = json["contact_name"];
    _contactEmail = json["contact_email"];
    _contactMobile = json["contact_mobile"];
    _alterMobile = json["alter_mobile"];
    _houseNo = json["house_no"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _zipCode = json["zip_code"];
    _landmark = json["landmark"];
    _additionalInfo = json["additional_info"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["payment_status"] = _paymentStatus;
    map["pickup_date"] = _pickupDate;
    map["pickup_time"] = _pickupTime;
    map["bulk_charge_per_pound"] = _bulkChargePerPound;
    map["estimate_weight"] = _estimateWeight;
    map["total_bulk_charge"] = _totalBulkCharge;
    map["bulk_cutoff_charge"] = _bulkCutoffCharge;
    map["tax_amount"] = _taxAmount;
    map["delivery_charges"] = _deliveryCharges;
    map["service_charge"] = _serviceCharge;
    map["total_payable"] = _totalPayable;
    map["estimate_charge"] = _estimateCharge;
    map["contact_name"] = _contactName;
    map["contact_email"] = _contactEmail;
    map["contact_mobile"] = _contactMobile;
    map["alter_mobile"] = _alterMobile;
    map["house_no"] = _houseNo;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    map["zip_code"] = _zipCode;
    map["landmark"] = _landmark;
    map["additional_info"] = _additionalInfo;
    return map;
  }

}

/// order_id : "32327576"
/// order_date : "16 Apr 2021"
/// payment_status : "Pending"
/// pickup_date : "17 Apr 2021"
/// pickup_time : "12:00-13:00"
/// bulk_charge_per_pound : "5.00"
/// estimate_weight : "50"
/// total_bulk_charge : "250.00"
/// bulk_cutoff_charge : "0.00"
/// tax_amount : "0.00"
/// delivery_charges : "25.00"
/// service_charge : "0.00"
/// total_payable : "275.00"
/// estimate_charge : "275.00"
/// contact_name : "Shovan Namdi"
/// contact_email : "shovannandi95@gmail.com"
/// contact_mobile : "8348338409"
/// alter_mobile : "0"
/// house_no : "12"
/// house_name : "Nandi Vila"
/// street : ""
/// city : "GUAM"
/// state : "GUAM"
/// country : "USA"
/// zip_code : "96913"
/// landmark : ""
/// additional_info : ""

class Current {
  String _orderId;
  String _orderDate;
  String _paymentStatus;
  String _pickupDate;
  String _pickupTime;
  String _bulkChargePerPound;
  String _estimateWeight;
  String _totalBulkCharge;
  String _bulkCutoffCharge;
  String _taxAmount;
  String _deliveryCharges;
  String _serviceCharge;
  String _totalPayable;
  String _estimateCharge;
  String _contactName;
  String _contactEmail;
  String _contactMobile;
  String _alterMobile;
  String _houseNo;
  String _houseName;
  String _street;
  String _city;
  String _state;
  String _country;
  String _zipCode;
  String _landmark;
  String _additionalInfo;

  String get orderId => _orderId;
  String get orderDate => _orderDate;
  String get paymentStatus => _paymentStatus;
  String get pickupDate => _pickupDate;
  String get pickupTime => _pickupTime;
  String get bulkChargePerPound => _bulkChargePerPound;
  String get estimateWeight => _estimateWeight;
  String get totalBulkCharge => _totalBulkCharge;
  String get bulkCutoffCharge => _bulkCutoffCharge;
  String get taxAmount => _taxAmount;
  String get deliveryCharges => _deliveryCharges;
  String get serviceCharge => _serviceCharge;
  String get totalPayable => _totalPayable;
  String get estimateCharge => _estimateCharge;
  String get contactName => _contactName;
  String get contactEmail => _contactEmail;
  String get contactMobile => _contactMobile;
  String get alterMobile => _alterMobile;
  String get houseNo => _houseNo;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipCode => _zipCode;
  String get landmark => _landmark;
  String get additionalInfo => _additionalInfo;

  Current({
      String orderId, 
      String orderDate, 
      String paymentStatus, 
      String pickupDate, 
      String pickupTime, 
      String bulkChargePerPound, 
      String estimateWeight, 
      String totalBulkCharge, 
      String bulkCutoffCharge, 
      String taxAmount, 
      String deliveryCharges, 
      String serviceCharge, 
      String totalPayable, 
      String estimateCharge, 
      String contactName, 
      String contactEmail, 
      String contactMobile, 
      String alterMobile, 
      String houseNo, 
      String houseName, 
      String street, 
      String city, 
      String state, 
      String country, 
      String zipCode, 
      String landmark, 
      String additionalInfo}){
    _orderId = orderId;
    _orderDate = orderDate;
    _paymentStatus = paymentStatus;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _bulkChargePerPound = bulkChargePerPound;
    _estimateWeight = estimateWeight;
    _totalBulkCharge = totalBulkCharge;
    _bulkCutoffCharge = bulkCutoffCharge;
    _taxAmount = taxAmount;
    _deliveryCharges = deliveryCharges;
    _serviceCharge = serviceCharge;
    _totalPayable = totalPayable;
    _estimateCharge = estimateCharge;
    _contactName = contactName;
    _contactEmail = contactEmail;
    _contactMobile = contactMobile;
    _alterMobile = alterMobile;
    _houseNo = houseNo;
    _houseName = houseName;
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipCode = zipCode;
    _landmark = landmark;
    _additionalInfo = additionalInfo;
}

  Current.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _orderDate = json["order_date"];
    _paymentStatus = json["payment_status"];
    _pickupDate = json["pickup_date"];
    _pickupTime = json["pickup_time"];
    _bulkChargePerPound = json["bulk_charge_per_pound"];
    _estimateWeight = json["estimate_weight"];
    _totalBulkCharge = json["total_bulk_charge"];
    _bulkCutoffCharge = json["bulk_cutoff_charge"];
    _taxAmount = json["tax_amount"];
    _deliveryCharges = json["delivery_charges"];
    _serviceCharge = json["service_charge"];
    _totalPayable = json["total_payable"];
    _estimateCharge = json["estimate_charge"];
    _contactName = json["contact_name"];
    _contactEmail = json["contact_email"];
    _contactMobile = json["contact_mobile"];
    _alterMobile = json["alter_mobile"];
    _houseNo = json["house_no"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _zipCode = json["zip_code"];
    _landmark = json["landmark"];
    _additionalInfo = json["additional_info"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["order_date"] = _orderDate;
    map["payment_status"] = _paymentStatus;
    map["pickup_date"] = _pickupDate;
    map["pickup_time"] = _pickupTime;
    map["bulk_charge_per_pound"] = _bulkChargePerPound;
    map["estimate_weight"] = _estimateWeight;
    map["total_bulk_charge"] = _totalBulkCharge;
    map["bulk_cutoff_charge"] = _bulkCutoffCharge;
    map["tax_amount"] = _taxAmount;
    map["delivery_charges"] = _deliveryCharges;
    map["service_charge"] = _serviceCharge;
    map["total_payable"] = _totalPayable;
    map["estimate_charge"] = _estimateCharge;
    map["contact_name"] = _contactName;
    map["contact_email"] = _contactEmail;
    map["contact_mobile"] = _contactMobile;
    map["alter_mobile"] = _alterMobile;
    map["house_no"] = _houseNo;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    map["zip_code"] = _zipCode;
    map["landmark"] = _landmark;
    map["additional_info"] = _additionalInfo;
    return map;
  }

}