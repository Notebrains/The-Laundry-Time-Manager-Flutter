/// status : 1
/// message : "Success"
/// response : [{"order_id":"38051781","customer_name":"Tanay Mitra","payment_for":"Premium Order","transaction_date":"29 Apr 2021","transaction_status":"Completed","transaction_amount":"1000.00","payment_mode":"Cash On Delivery"}]

class SalesResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  SalesResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  SalesResModel.fromJson(dynamic json) {
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

/// order_id : "38051781"
/// customer_name : "Tanay Mitra"
/// payment_for : "Premium Order"
/// transaction_date : "29 Apr 2021"
/// transaction_status : "Completed"
/// transaction_amount : "1000.00"
/// payment_mode : "Cash On Delivery"

class Response {
  String _orderId;
  String _customerName;
  String _paymentFor;
  String _transactionDate;
  String _transactionStatus;
  String _transactionAmount;
  String _paymentMode;

  String get orderId => _orderId;
  String get customerName => _customerName;
  String get paymentFor => _paymentFor;
  String get transactionDate => _transactionDate;
  String get transactionStatus => _transactionStatus;
  String get transactionAmount => _transactionAmount;
  String get paymentMode => _paymentMode;

  Response({
      String orderId, 
      String customerName, 
      String paymentFor, 
      String transactionDate, 
      String transactionStatus, 
      String transactionAmount, 
      String paymentMode}){
    _orderId = orderId;
    _customerName = customerName;
    _paymentFor = paymentFor;
    _transactionDate = transactionDate;
    _transactionStatus = transactionStatus;
    _transactionAmount = transactionAmount;
    _paymentMode = paymentMode;
}

  Response.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _customerName = json["customer_name"];
    _paymentFor = json["payment_for"];
    _transactionDate = json["transaction_date"];
    _transactionStatus = json["transaction_status"];
    _transactionAmount = json["transaction_amount"];
    _paymentMode = json["payment_mode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["customer_name"] = _customerName;
    map["payment_for"] = _paymentFor;
    map["transaction_date"] = _transactionDate;
    map["transaction_status"] = _transactionStatus;
    map["transaction_amount"] = _transactionAmount;
    map["payment_mode"] = _paymentMode;
    return map;
  }

}