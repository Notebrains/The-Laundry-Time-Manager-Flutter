/// status : 1
/// message : "Success"
/// response : [{"id":"1","order":"1","image":"https://mridayadevstudio.com/tlt_dev/uploads/11.png"},{"id":"2","order":"2","image":"https://mridayadevstudio.com/tlt_dev/uploads/21.png"},{"id":"3","order":"3","image":"https://mridayadevstudio.com/tlt_dev/uploads/31.png"}]

class TutorialResModel {
  int _status;
  String _message;
  List<Response> _response;

  int get status => _status;
  String get message => _message;
  List<Response> get response => _response;

  TutorialResModel({
      int status, 
      String message, 
      List<Response> response}){
    _status = status;
    _message = message;
    _response = response;
}

  TutorialResModel.fromJson(dynamic json) {
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

/// id : "1"
/// order : "1"
/// image : "https://mridayadevstudio.com/tlt_dev/uploads/11.png"

class Response {
  String _id;
  String _order;
  String _image;

  String get id => _id;
  String get order => _order;
  String get image => _image;

  Response({
      String id, 
      String order, 
      String image}){
    _id = id;
    _order = order;
    _image = image;
}

  Response.fromJson(dynamic json) {
    _id = json["id"];
    _order = json["order"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["order"] = _order;
    map["image"] = _image;
    return map;
  }

}