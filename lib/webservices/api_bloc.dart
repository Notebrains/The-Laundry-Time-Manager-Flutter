import 'package:rxdart/rxdart.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/webservices/response_models/status_msg_res_model.dart';
import 'response_models/bulk_pick_up_res_model.dart';
import 'response_models/home_category_res_model.dart';
import 'response_models/login_res_model.dart';
import 'response_models/premium_drop_off_res_model.dart';
import 'response_models/premium_pick_up_res_model.dart';

class ApiBloc {
  Repository _repository = Repository();

  //Login
  final _loginResFetcher = PublishSubject<LoginResModel>();
  Stream<LoginResModel> get loginRes => _loginResFetcher.stream;
  fetchLoginApi(String email, String password) async {
    LoginResModel loginResponse = await _repository.fetchLoginApi(email, password);
    _loginResFetcher.sink.add(loginResponse);
  }

  //Request Pass Fetcher
  final _requestPassFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get requestPassApi => _requestPassFetcher.stream;
  fetchRequestPassApi(String email) async {
    StatusMsgResModel loginResponse = await _repository.fetchRequestPassApi(email);
    _requestPassFetcher.sink.add(loginResponse);
  }

  //Premium Pickup List Fetcher
  final _premiumPickupListFetcher = PublishSubject<PremiumPickUpResModel>();
  Stream<PremiumPickUpResModel> get premiumPickupListApi => _premiumPickupListFetcher.stream;
  fetchPremiumPickupListsApi(String driverId) async {
    PremiumPickUpResModel loginResponse = await _repository.fetchPremiumPickupListsApi(driverId);
    _premiumPickupListFetcher.sink.add(loginResponse);
  }

  //Premium Delivery List Fetcher
  final _premiumDeliveryListFetcher = PublishSubject<PremiumDropOffResModel>();
  Stream<PremiumDropOffResModel> get premiumDeliveryListApi => _premiumDeliveryListFetcher.stream;
  fetchPremiumDeliveryListsApi(String driverId) async {
    PremiumDropOffResModel loginResponse = await _repository.fetchPremiumDeliveryListsApi(driverId);
    _premiumDeliveryListFetcher.sink.add(loginResponse);
  }

  //Bulk Pickup Lists Api
  final _fetchBulkPickupListFetcher = PublishSubject<BulkPickUpResModel>();
  Stream<BulkPickUpResModel> get bulkPickupListApi => _fetchBulkPickupListFetcher.stream;
  fetchBulkPickupListsApi(String driverId) async {
    BulkPickUpResModel loginResponse = await _repository.fetchBulkPickupListsApi(driverId);
    _fetchBulkPickupListFetcher.sink.add(loginResponse);
  }

  //Bulk Delivery List Api
  final _fetchBulkDeliveryListFetcher = PublishSubject<BulkPickUpResModel>();
  Stream<BulkPickUpResModel> get bulkDeliveryListApi => _fetchBulkDeliveryListFetcher.stream;
  fetchBulkDeliveryListsApi(String driverId) async {
    BulkPickUpResModel loginResponse = await _repository.fetchBulkDeliveryListsApi(driverId);
    _fetchBulkDeliveryListFetcher.sink.add(loginResponse);
  }


  //Accept Pickup Request
  final _fetchUpdateOrderRequestFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get acceptUpdateOrderRequestFetcherApi => _fetchUpdateOrderRequestFetcher.stream;
  fetchUpdateOrderRequestApi(String requestType, String orderId, String pickupStatus,
      String deliveryStatus, String cancelReason) async {
    StatusMsgResModel loginResponse = await _repository.fetchUpdateOrderRequestApi(requestType, orderId, pickupStatus, deliveryStatus, cancelReason);
    _fetchUpdateOrderRequestFetcher.sink.add(loginResponse);
  }

  //Update Pickup Success
  final _fetchUpdatePickupSuccessFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get updatePickupSuccessApi => _fetchUpdatePickupSuccessFetcher.stream;
  fetchUpdatePickupSuccessApi(String orderId, String selectedItems) async {
    StatusMsgResModel loginResponse = await _repository.fetchUpdatePickupSuccessApi(orderId, selectedItems);
    _fetchUpdatePickupSuccessFetcher.sink.add(loginResponse);
  }


  //Update Delivery Success
  final _fetchUpdateDeliverySuccessFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get updateDeliverySuccessApi => _fetchUpdateDeliverySuccessFetcher.stream;
  fetchUpdateDeliverySuccessApi(String orderId) async {
    StatusMsgResModel loginResponse = await _repository.fetchUpdateDeliverySuccessApi(orderId);
    _fetchUpdateDeliverySuccessFetcher.sink.add(loginResponse);
  }


  //Update Cod Payment
  final _fetchUpdateCodPaymentFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get updateCodPaymentApi => _fetchUpdateCodPaymentFetcher.stream;
  fetchUpdateCodPaymentApi(String orderId, String receivedAmount, String paymentType) async {
    StatusMsgResModel loginResponse = await _repository.fetchUpdateCodPaymentApi(orderId, receivedAmount, paymentType);
    _fetchUpdateCodPaymentFetcher.sink.add(loginResponse);
  }


  // Update Bulk Weight Fetcher
  final _fetchUpdateBulkWeightFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get updateBulkWeightApi => _fetchUpdateBulkWeightFetcher.stream;
  fetchUpdateBulkWeightApi(String orderId, String bulkWeight) async {
    StatusMsgResModel loginResponse = await _repository.fetchUpdateBulkWeightApi(orderId, bulkWeight);
    _fetchUpdateBulkWeightFetcher.sink.add(loginResponse);
  }


  // Update Bulk Weight Fetcher
  final _fetchUpdateDeviceTokenFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get updateDeviceTokenApi => _fetchUpdateDeviceTokenFetcher.stream;
  fetchUpdateDeviceTokenApi(String driverId, String deviceToken) async {
    StatusMsgResModel loginResponse = await _repository.fetchUpdateDeviceTokenApi( driverId, deviceToken);
    _fetchUpdateDeviceTokenFetcher.sink.add(loginResponse);
  }


  dispose() {
    //Close the api fetcher
    _loginResFetcher.close();
    _requestPassFetcher.close();
    _premiumPickupListFetcher.close();
    _premiumDeliveryListFetcher.close();
    _fetchBulkPickupListFetcher.close();
    _fetchBulkDeliveryListFetcher.close();
    _fetchUpdateOrderRequestFetcher.close();
    _fetchUpdatePickupSuccessFetcher.close();
    _fetchUpdateDeliverySuccessFetcher.close();
    _fetchUpdateCodPaymentFetcher.close();
    _fetchUpdateBulkWeightFetcher.close();
    _fetchUpdateDeviceTokenFetcher.close();
  }
}

final apiBloc = ApiBloc();
