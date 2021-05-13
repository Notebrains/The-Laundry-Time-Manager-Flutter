import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/webservices/response_models/customer_list_res_model.dart';
import 'package:tlt_manager/webservices/response_models/drop_off_res_model.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';
import 'package:tlt_manager/webservices/response_models/orders_res_model.dart';
import 'package:tlt_manager/webservices/response_models/pick_up_res_model.dart';
import 'package:tlt_manager/webservices/response_models/product_res_model.dart';
import 'package:tlt_manager/webservices/response_models/reviews_res_model.dart';
import 'package:tlt_manager/webservices/response_models/sales_res_model.dart';
import 'response_models/login_res_model.dart';
import 'response_models/status_msg_res_model.dart';

class ApiProvider {
  Client client = Client();

  final Map<String, String> header = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
    'auth_key': 'AKJUY8746474JGKGJ888FJFKDKD9999DKDNDFJ44',
    'user_id': 'TLT-2021-@#-01',
  };


  // update_device_token
  Future<StatusMsgResModel> fetchUpdateDeviceTokenApi(String managerId, String deviceToken) async {
    var requestBody = {
      'manager_id': managerId,
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


  // customers_list
  Future<CustomerListResModel> fetchCustomerListsApi() async {
    http.Response response = await http.get(
      Uri.parse(UrlConstants.customers_list),
      headers: header,
    );

    print('----customers_list res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return CustomerListResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load customers_list response');
    }
  }

  // delete_customer
  Future<StatusMsgResModel> fetchDeleteCustomerApi(String customerId) async {
    var requestBody = {
      'customer_id': customerId,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.delete_customer),
      headers: header,
      body: requestBody,
    );

    print('----delete customer res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return StatusMsgResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load delete customer response');
    }
  }

  // sales
  Future<SalesResModel> fetchSalesApi() async {

    http.Response response = await http.get(
      Uri.parse(UrlConstants.sales),
      headers: header,
    );

    print('----sales res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return SalesResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load sales response');
    }
  }

  // reviews
  Future<ReviewsResModel> fetchReviewApi() async {

    http.Response response = await http.get(
      Uri.parse(UrlConstants.reviews),
      headers: header,
    );

    print('----reviews res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return ReviewsResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load reviews response');
    }
  }

  // get_items
  Future<ProductResModel> fetchItemsApi() async {

    http.Response response = await http.get(
      Uri.parse(UrlConstants.get_items),
      headers: header,
    );

    print('----get_items res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return ProductResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load get_items response');
    }
  }

  // Offers
  Future<OffersResModel> fetchOffersApi() async {
    http.Response response = await http.get(
      Uri.parse(UrlConstants.offers_list),
      headers: header,
    );

    print('----offers_list res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return OffersResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load offers_list response');
    }
  }


  // orders
  Future<OrdersResModel> fetchOrdersApi(String fromDate, String toDate) async {
    var requestBody = {
      'from_date': fromDate,
      'to_date': toDate,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.orders),
      headers: header,
      body: requestBody,
    );

    print('----orders res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return OrdersResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load orders response');
    }
  }


  // pickup_lists
  Future<PickUpResModel> fetchPickUpListsApi(String fromDate, String toDate,) async {
    var requestBody = {
      'from_date': fromDate,
      'to_date': toDate,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.pickup_lists),
      headers: header,
      body: requestBody,
    );

    print('----pickup_lists res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return PickUpResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load pickup_lists response');
    }
  }


// drop off list
  Future<DropOffResModel> fetchDropOffListsApi(String fromDate, String toDate,) async {
    var requestBody = {
      'from_date': fromDate,
      'to_date': toDate,
    };

    http.Response response = await http.post(
      Uri.parse(UrlConstants.dropoff_lists),
      headers: header,
      body: requestBody,
    );

    print('----drop off_lists res :  ${response.body.toString()}');

    if (response.statusCode == 200) {
      return DropOffResModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load drop off lists response');
    }
  }
}
