import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'response_models/bulk_pick_up_res_model.dart';
import 'response_models/home_category_res_model.dart';
import 'response_models/login_res_model.dart';
import 'response_models/premium_drop_off_res_model.dart';
import 'response_models/premium_pick_up_res_model.dart';
import 'response_models/status_msg_res_model.dart';

class ApiProvider {
  Client client = Client();

  final Map<String, String> header = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
    'auth_key': 'AKJUY8746474JGKGJ888FJFKDKD9999DKDNDFJ44',
    'user_id': 'TLT-2021-@#-01',
  };

  // login
  Future<LoginResModel> fetchLoginApi(String email, String password) async {
    var requestBody = {
      'email': email,
      'password': password,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.login_url),
      headers: header,
      body: requestBody,
    );

    print('----Login Res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return LoginResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load Login response');
    }
  }

  // Request password
  Future<StatusMsgResModel> fetchRequestPassApi(String email) async {
    var requestBody = {
      'email': email,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.request_password),
      headers: header,
      body: requestBody,
    );

    print('----Request password res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load request password response');
    }
  }


  // premium_pickup_lists
  Future<PremiumPickUpResModel> fetchPremiumPickupListsApi(String driverId) async {
    var requestBody = {
      'driver_id': driverId,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.premium_pickup_lists),
      headers: header,
      body: requestBody,
    );

    print('----premium_pickup_lists res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return PremiumPickUpResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load premium_pickup_lists response');
    }
  }

  // premium_delivery_lists
  Future<PremiumDropOffResModel> fetchPremiumDeliveryListsApi(String driverId) async {
    var requestBody = {
      'driver_id': driverId,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.premium_delivery_lists),
      headers: header,
      body: requestBody,
    );

    print('----premium_delivery_lists res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return PremiumDropOffResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load premium_delivery_lists response');
    }
  }

  // bulk_pickup_lists
  Future<BulkPickUpResModel> fetchBulkPickupListsApi(String driverId) async {
    var requestBody = {
      'driver_id': driverId,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.bulk_pickup_lists),
      headers: header,
      body: requestBody,
    );

    print('----bulk_pickup_lists res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return BulkPickUpResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load bulk_pickup_lists response');
    }
  }


  // bulk_delivery_lists
  Future<BulkPickUpResModel> fetchBulkDeliveryListsApi(String driverId) async {
    var requestBody = {
      'driver_id': driverId,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.bulk_pickup_lists),
      headers: header,
      body: requestBody,
    );

    print('----bulk_delivery_lists res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return BulkPickUpResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load bulk_delivery_lists response');
    }
  }


  // fetch Update Order Request Api
  Future<StatusMsgResModel> fetchUpdateOrderRequestApi(String requestType, String driverId, String pickupStatus,
      String deliveryStatus, String cancelReason) async {
    var requestBody = {
      'request_type': requestType,
      'order_id': driverId,
      'pickup_status': pickupStatus,
      'delivery_status': deliveryStatus,
      'cancel_reason': cancelReason,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.update_order_request),
      headers: header,
      body: requestBody,
    );

    print('----accept_pickup_request res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load accept_pickup_request response');
    }
  }


  // update_pickup_success
  Future<StatusMsgResModel> fetchUpdatePickupSuccessApi(String orderId, String selectedItems) async {
    var requestBody = {
      'order_id': orderId,
      'selected_items': selectedItems,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.update_pickup_success),
      headers: header,
      body: requestBody,
    );

    print('----update_pickup_success res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load update_pickup_success response');
    }
  }


  // update_delivery_success
  Future<StatusMsgResModel> fetchUpdateDeliverySuccessApi(String orderId) async {
    var requestBody = {
      'order_id': orderId
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.update_delivery_success),
      headers: header,
      body: requestBody,
    );

    print('----update_Delivery_success res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load update_Delivery_success response');
    }
  }


  // update_cod_payment
  Future<StatusMsgResModel> fetchUpdateCodPaymentApi(String orderId, String receivedAmount, String paymentType) async {
    var requestBody = {
      'order_id': orderId,
      'received_amount': receivedAmount,
      'payment_type': paymentType,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.update_cod_payment),
      headers: header,
      body: requestBody,
    );

    print('----update_cod_payment res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load update_cod_payment response');
    }
  }


  // update_bulk_weight
  Future<StatusMsgResModel> fetchUpdateBulkWeightApi(String orderId, String bulkWeight) async {
    var requestBody = {
      'order_id': orderId,
      'bulk_weight': bulkWeight,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.update_bulk_weight),
      headers: header,
      body: requestBody,
    );

    print('----UpdateBulkWeight res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load UpdateBulkWeight response');
    }
  }


  // update_device_token
  Future<StatusMsgResModel> fetchUpdateDeviceTokenApi(String driverId, String deviceToken) async {
    var requestBody = {
      'driver_id': driverId,
      'device_token': deviceToken,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.update_device_token),
      headers: header,
      body: requestBody,
    );

    print('----update_device_token res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load update_device_token response');
    }
  }
}
