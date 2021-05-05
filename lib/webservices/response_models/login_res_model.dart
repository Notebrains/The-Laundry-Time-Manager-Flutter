/// status : 1
/// message : "Success"
/// response : {"id":"2","name":"Tan Mit","email":"tanay.sit.it@hotmail.com","mobile":"8793214560"}

class LoginResModel {
  int _status;
  String _message;
  Response _response;

  int get status => _status;
  String get message => _message;
  Response get response => _response;

  LoginResModel({
      int status,
      String message,
      Response response}){
    _status = status;
    _message = message;
    _response = response;
}

  LoginResModel.fromJson(dynamic json) {
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

/// id : "2"
/// name : "Tan Mit"
/// email : "tanay.sit.it@hotmail.com"
/// mobile : "8793214560"

class Response {
  String _id;
  String _name;
  String _email;
  String _mobile;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;

  Response({
      String id,
      String name,
      String email,
      String mobile}){
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
}

  Response.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["email"] = _email;
    map["mobile"] = _mobile;
    return map;
  }

}