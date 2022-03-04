/// status : 1
/// message : "Success"
/// response : [{"id":"5","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","post_code":"","status":"Active","usertype":"Authenticate user","address":[{"id":"23","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""},{"id":"24","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""},{"id":"25","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"11","name":"pradeep","email":"prad7kumar@gmail.com","mobile":"6719889748","post_code":"","status":"Active","usertype":"Authenticate user","address":[{"id":"6","name":"pradeep","email":"prad7kumar@gmail.com","mobile":"6719889748","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""},{"id":"7","name":"pradeep","email":"prad7kumar@gmail.com","mobile":"6719889748","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""},{"id":"8","name":"pradeep","email":"prad7kumar@gmail.com","mobile":"6719889748","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"12","name":"Imdadul","email":"imdadulh@mridayaitservices.com","mobile":"9564636037","post_code":"12345","status":"Active","usertype":"Authenticate user","address":[{"id":"9","name":"Imdadul","email":"imdadulh@mridayaitservices.com","mobile":"9564636037","house_name":"","street":"","city":"","country":"","post_code":"12345","alter_mobile":"","additional_info":"","landmark":""},{"id":"17","name":"Imdadul","email":"imdadulh@mridayaitservices.com","mobile":"9564636037","house_name":"","street":"","city":"","country":"","post_code":"12345","alter_mobile":"","additional_info":"","landmark":""},{"id":"18","name":"Imdadul","email":"imdadulh@mridayaitservices.com","mobile":"9564636037","house_name":"","street":"","city":"","country":"","post_code":"12345","alter_mobile":"","additional_info":"","landmark":""},{"id":"19","name":"Imdadul","email":"imdadulh@mridayaitservices.com","mobile":"9564636037","house_name":"","street":"","city":"","country":"","post_code":"12345","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"13","name":"Shovan Nandi","email":"shovannandi95@gmail.com","mobile":"8348338409","post_code":"","status":"Active","usertype":"Authenticate user","address":[{"id":"10","name":"Shovan Nandi","email":"shovannandi95@gmail.com","mobile":"8348338409","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"21","name":"Sudeep panda","email":"sudeepp2012@gmail.com","mobile":"919830073698","post_code":"","status":"Active","usertype":"Authenticate user","address":[{"id":"20","name":"Sudeep panda","email":"sudeepp2012@gmail.com","mobile":"919830073698","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"22","name":"Shovan Nandi","email":"shovannandi97@gmail.com","mobile":"6296981547","post_code":"","status":"Active","usertype":"Authenticate user","address":[{"id":"21","name":"Shovan Nandi","email":"shovannandi97@gmail.com","mobile":"6296981547","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"23","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592","post_code":"","status":"Active","usertype":"Authenticate user","address":[{"id":"22","name":"Tanay Mitra","email":"tanay.sit.it@gmail.com","mobile":"9173037592","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]},{"id":"24","name":"Ashley Alisasis","email":"aashley2500@gmail.com","mobile":"6716897787","post_code":"","status":"Active","usertype":"Authenticate user","address":[]},{"id":"25","name":"Imdadul Haque","email":"imdadulhaque.bt@gmail.com","mobile":"09564636037","post_code":"","status":"Active","usertype":"Authenticate user","address":[]}]

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

/// id : "5"
/// name : "Lanzel"
/// email : "lanzelvalencia@gmail.com"
/// mobile : "6714803182"
/// post_code : ""
/// status : "Active"
/// usertype : "Authenticate user"
/// address : [{"id":"23","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""},{"id":"24","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""},{"id":"25","name":"Lanzel","email":"lanzelvalencia@gmail.com","mobile":"6714803182","house_name":"","street":"","city":"","country":"","post_code":"","alter_mobile":"","additional_info":"","landmark":""}]

class Response {
  String _id;
  String _name;
  String _email;
  String _mobile;
  String _postCode;
  String _status;
  String _usertype;
  List<Address> _address;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;
  String get postCode => _postCode;
  String get status => _status;
  String get usertype => _usertype;
  List<Address> get address => _address;

  Response({
      String id, 
      String name, 
      String email, 
      String mobile, 
      String postCode, 
      String status, 
      String usertype, 
      List<Address> address}){
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _postCode = postCode;
    _status = status;
    _usertype = usertype;
    _address = address;
}

  Response.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
    _postCode = json["post_code"];
    _status = json["status"];
    _usertype = json["usertype"];
    if (json["address"] != null) {
      _address = [];
      json["address"].forEach((v) {
        _address.add(Address.fromJson(v));
      });
    }
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
    if (_address != null) {
      map["address"] = _address.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "23"
/// name : "Lanzel"
/// email : "lanzelvalencia@gmail.com"
/// mobile : "6714803182"
/// house_name : ""
/// street : ""
/// city : ""
/// country : ""
/// post_code : ""
/// alter_mobile : ""
/// additional_info : ""
/// landmark : ""

class Address {
  String _id;
  String _name;
  String _email;
  String _mobile;
  String _houseName;
  String _street;
  String _city;
  String _country;
  String _postCode;
  String _alterMobile;
  String _additionalInfo;
  String _landmark;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;
  String get houseName => _houseName;
  String get street => _street;
  String get city => _city;
  String get country => _country;
  String get postCode => _postCode;
  String get alterMobile => _alterMobile;
  String get additionalInfo => _additionalInfo;
  String get landmark => _landmark;

  Address({
      String id, 
      String name, 
      String email, 
      String mobile, 
      String houseName, 
      String street, 
      String city, 
      String country, 
      String postCode, 
      String alterMobile, 
      String additionalInfo, 
      String landmark}){
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _houseName = houseName;
    _street = street;
    _city = city;
    _country = country;
    _postCode = postCode;
    _alterMobile = alterMobile;
    _additionalInfo = additionalInfo;
    _landmark = landmark;
}

  Address.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
    _houseName = json["house_name"];
    _street = json["street"];
    _city = json["city"];
    _country = json["country"];
    _postCode = json["post_code"];
    _alterMobile = json["alter_mobile"];
    _additionalInfo = json["additional_info"];
    _landmark = json["landmark"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["email"] = _email;
    map["mobile"] = _mobile;
    map["house_name"] = _houseName;
    map["street"] = _street;
    map["city"] = _city;
    map["country"] = _country;
    map["post_code"] = _postCode;
    map["alter_mobile"] = _alterMobile;
    map["additional_info"] = _additionalInfo;
    map["landmark"] = _landmark;
    return map;
  }

}