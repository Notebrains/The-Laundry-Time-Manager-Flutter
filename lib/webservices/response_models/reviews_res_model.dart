/// status : 1
/// message : "Success"
/// response : [{"order_id":"12354","customer_name":"Lanzel","review_date":"10 May 2021","rating":"4.0","review":"Test"}]

class ReviewsResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  ReviewsResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  ReviewsResModel.fromJson(dynamic json) {
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

/// order_id : "12354"
/// customer_name : "Lanzel"
/// review_date : "10 May 2021"
/// rating : "4.0"
/// review : "Test"

class Response {
  String _orderId;
  String _customerName;
  String _reviewDate;
  String _rating;
  String _review;

  String get orderId => _orderId;
  String get customerName => _customerName;
  String get reviewDate => _reviewDate;
  String get rating => _rating;
  String get review => _review;

  Response({
      String orderId, 
      String customerName, 
      String reviewDate, 
      String rating, 
      String review}){
    _orderId = orderId;
    _customerName = customerName;
    _reviewDate = reviewDate;
    _rating = rating;
    _review = review;
}

  Response.fromJson(dynamic json) {
    _orderId = json["order_id"];
    _customerName = json["customer_name"];
    _reviewDate = json["review_date"];
    _rating = json["rating"];
    _review = json["review"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["order_id"] = _orderId;
    map["customer_name"] = _customerName;
    map["review_date"] = _reviewDate;
    map["rating"] = _rating;
    map["review"] = _review;
    return map;
  }

}