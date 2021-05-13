/// status : 1
/// message : "Success"
/// response : [{"id":"3","name":"Everlee","email":"everleef@gmail.com","mobile":"6716780004","post_code":"","status":"Active","usertype":"Suspicious user"}]

class CustomerListResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  CustomerListResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  CustomerListResModel.fromJson(dynamic json) {
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

/// id : "3"
/// name : "Everlee"
/// email : "everleef@gmail.com"
/// mobile : "6716780004"
/// post_code : ""
/// status : "Active"
/// usertype : "Suspicious user"

class Response {
  String _id;
  String _name;
  String _email;
  String _mobile;
  String _postCode;
  String _status;
  String _usertype;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;
  String get postCode => _postCode;
  String get status => _status;
  String get usertype => _usertype;

  Response({
      String id, 
      String name, 
      String email, 
      String mobile, 
      String postCode, 
      String status, 
      String usertype}){
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _postCode = postCode;
    _status = status;
    _usertype = usertype;
}

  Response.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
    _postCode = json["post_code"];
    _status = json["status"];
    _usertype = json["usertype"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["email"] = _email;
    map["mobile"] = _mobile;
    map["post_code"] = _postCode;
    map["status"] = _status;
    map["usertype"] = _usertype;
    return map;
  }

}