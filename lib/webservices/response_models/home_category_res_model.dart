/// status : 1
/// message : "Success"
/// response : {"category":[{"id":"5","name":"OCCASIONAL WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/shutterstock_433891999.png"},{"id":"4","name":"HOUSEHOLD ITEMS","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/blanket.png"},{"id":"3","name":"MEN'S WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/mens-checks-shirt-500x500.jpg"},{"id":"2","name":"WOMEN'S WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/dress.png"},{"id":"1","name":"KID'S WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/house.jpg"}],"home_banner":[{"id":"1","image":"https://mridayadevstudio.com/tlt_dev/uploads/banner-offer-1.jpg"}]}

class HomeCategoryResModel {
  int _status;
  String _message;
  Response _response;

  int get status => _status;
  String get message => _message;
  Response get response => _response;

  HomeCategoryResModel({
      int status, 
      String message, 
      Response response}){
    _status = status;
    _message = message;
    _response = response;
}

  HomeCategoryResModel.fromJson(dynamic json) {
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

/// category : [{"id":"5","name":"OCCASIONAL WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/shutterstock_433891999.png"},{"id":"4","name":"HOUSEHOLD ITEMS","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/blanket.png"},{"id":"3","name":"MEN'S WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/mens-checks-shirt-500x500.jpg"},{"id":"2","name":"WOMEN'S WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/dress.png"},{"id":"1","name":"KID'S WEAR","details":"","image":"https://mridayadevstudio.com/tlt_dev/uploads/house.jpg"}]
/// home_banner : [{"id":"1","image":"https://mridayadevstudio.com/tlt_dev/uploads/banner-offer-1.jpg"}]

class Response {
  List<Category> _category;
  List<Home_banner> _homeBanner;

  List<Category> get category => _category;
  List<Home_banner> get homeBanner => _homeBanner;

  Response({
      List<Category> category, 
      List<Home_banner> homeBanner}){
    _category = category;
    _homeBanner = homeBanner;
}

  Response.fromJson(dynamic json) {
    if (json["category"] != null) {
      _category = [];
      json["category"].forEach((v) {
        _category.add(Category.fromJson(v));
      });
    }
    if (json["home_banner"] != null) {
      _homeBanner = [];
      json["home_banner"].forEach((v) {
        _homeBanner.add(Home_banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_category != null) {
      map["category"] = _category.map((v) => v.toJson()).toList();
    }
    if (_homeBanner != null) {
      map["home_banner"] = _homeBanner.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// image : "https://mridayadevstudio.com/tlt_dev/uploads/banner-offer-1.jpg"

class Home_banner {
  String _id;
  String _image;

  String get id => _id;
  String get image => _image;

  Home_banner({
      String id, 
      String image}){
    _id = id;
    _image = image;
}

  Home_banner.fromJson(dynamic json) {
    _id = json["id"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["image"] = _image;
    return map;
  }

}

/// id : "5"
/// name : "OCCASIONAL WEAR"
/// details : ""
/// image : "https://mridayadevstudio.com/tlt_dev/uploads/shutterstock_433891999.png"

class Category {
  String _id;
  String _name;
  String _details;
  String _image;

  String get id => _id;
  String get name => _name;
  String get details => _details;
  String get image => _image;

  Category({
      String id, 
      String name, 
      String details, 
      String image}){
    _id = id;
    _name = name;
    _details = details;
    _image = image;
}

  Category.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _details = json["details"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["details"] = _details;
    map["image"] = _image;
    return map;
  }

}