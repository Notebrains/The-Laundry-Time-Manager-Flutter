import 'package:tlt_manager/ui/exports/helpers.dart';

import 'response_models/bulk_pick_up_res_model.dart';
import 'response_models/home_category_res_model.dart';
import 'response_models/login_res_model.dart';
import 'response_models/premium_drop_off_res_model.dart';
import 'response_models/premium_pick_up_res_model.dart';
import 'response_models/status_msg_res_model.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<LoginResModel> fetchLoginApi(String email, String password) => appApiProvider.fetchLoginApi(email, password);

  Future<StatusMsgResModel> fetchRequestPassApi(String email) => appApiProvider.fetchRequestPassApi(email);

  Future<PremiumPickUpResModel> fetchPremiumPickupListsApi(String driverId) => appApiProvider.fetchPremiumPickupListsApi(driverId);

  Future<PremiumDropOffResModel> fetchPremiumDeliveryListsApi(String driverId) => appApiProvider.fetchPremiumDeliveryListsApi(driverId);

  Future<BulkPickUpResModel> fetchBulkPickupListsApi(String driverId) => appApiProvider.fetchBulkPickupListsApi(driverId);

  Future<BulkPickUpResModel> fetchBulkDeliveryListsApi(String driverId) => appApiProvider.fetchBulkDeliveryListsApi(driverId);

  Future<StatusMsgResModel> fetchUpdateOrderRequestApi(String requestType, String orderId, String pickupStatus,
      String deliveryStatus, String cancelReason) =>
      appApiProvider.fetchUpdateOrderRequestApi(requestType, orderId, pickupStatus, deliveryStatus, cancelReason);


  Future<StatusMsgResModel> fetchUpdatePickupSuccessApi(String orderId, String selectedItems) =>
      appApiProvider.fetchUpdatePickupSuccessApi(orderId, selectedItems);

  Future<StatusMsgResModel> fetchUpdateDeliverySuccessApi(String orderId) => appApiProvider.fetchUpdateDeliverySuccessApi(orderId);

  Future<StatusMsgResModel> fetchUpdateCodPaymentApi(String orderId, String receivedAmount, String paymentType) =>
      appApiProvider.fetchUpdateCodPaymentApi(orderId, receivedAmount, paymentType);

  Future<StatusMsgResModel> fetchUpdateBulkWeightApi(String orderId, String bulkWeight) =>
      appApiProvider.fetchUpdateBulkWeightApi(orderId, bulkWeight);

  Future<StatusMsgResModel> fetchUpdateDeviceTokenApi(String driverId, String deviceToken) =>
      appApiProvider.fetchUpdateDeviceTokenApi(driverId, deviceToken);
}
