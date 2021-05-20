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

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<LoginResModel> fetchLoginApi(String email, String password) => appApiProvider.fetchLoginApi(email, password);

  Future<StatusMsgResModel> fetchUpdateDeviceTokenApi(String managerId, String deviceToken) =>
      appApiProvider.fetchUpdateDeviceTokenApi(managerId, deviceToken);

  Future<CustomerListResModel> fetchCustomerListsApi() => appApiProvider.fetchCustomerListsApi();

  Future<ProductResModel> fetchItemsApi() => appApiProvider.fetchItemsApi();

  Future<OffersResModel> fetchOffersApi() => appApiProvider.fetchOffersApi();

  Future<ReviewsResModel> fetchReviewApi() => appApiProvider.fetchReviewApi();

  Future<SalesResModel> fetchSalesApi() => appApiProvider.fetchSalesApi();

  Future<OrdersResModel> fetchOrdersApi(String fromDate, String toDate) => appApiProvider.fetchOrdersApi( fromDate, toDate);

  Future<OrdersResModel> fetchCustomerOrdersApi(String customerId) => appApiProvider.fetchCustomerOrdersApi(customerId);

  Future<StatusMsgResModel> fetchDeleteCustomerApi(String customerId) => appApiProvider.fetchDeleteCustomerApi(customerId);

  Future<PickUpResModel> fetchPickUpListsApi(String fromDate, String toDate) => appApiProvider.fetchPickUpListsApi(fromDate, toDate);

  Future<DropOffResModel> fetchDropOffListsApi(String fromDate, String toDate) => appApiProvider.fetchDropOffListsApi(fromDate, toDate);


}
