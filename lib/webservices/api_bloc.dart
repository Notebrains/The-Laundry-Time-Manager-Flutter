import 'package:rxdart/rxdart.dart';
import 'package:tlt_manager/ui/exports/helpers.dart';
import 'package:tlt_manager/webservices/response_models/customer_list_res_model.dart';
import 'package:tlt_manager/webservices/response_models/customer_orders_res_model.dart';
import 'package:tlt_manager/webservices/response_models/offers_res_model.dart';
import 'package:tlt_manager/webservices/response_models/orders_res_model.dart';
import 'package:tlt_manager/webservices/response_models/pick_up_res_model.dart';
import 'package:tlt_manager/webservices/response_models/product_res_model.dart';
import 'package:tlt_manager/webservices/response_models/reviews_res_model.dart';
import 'package:tlt_manager/webservices/response_models/sales_res_model.dart';
import 'package:tlt_manager/webservices/response_models/status_msg_res_model.dart';
import 'response_models/drop_off_res_model.dart';
import 'response_models/login_res_model.dart';

class ApiBloc {
  Repository _repository = Repository();

  //Login
  final _loginResFetcher = PublishSubject<LoginResModel>();
  Stream<LoginResModel> get loginRes => _loginResFetcher.stream;
  fetchLoginApi(String email, String password) async {
    LoginResModel loginResponse = await _repository.fetchLoginApi(email, password);
    _loginResFetcher.sink.add(loginResponse);
  }

  // device token
  final _fetchUpdateDeviceTokenFetcher = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get updateDeviceTokenApi => _fetchUpdateDeviceTokenFetcher.stream;
  fetchUpdateDeviceTokenApi(String managerId, String deviceToken) async {
    StatusMsgResModel model = await _repository.fetchUpdateDeviceTokenApi( managerId, deviceToken);
    _fetchUpdateDeviceTokenFetcher.sink.add(model);
  }


  // fetch Customer Lists Api
  final _fetchCustomerListsApi = PublishSubject<CustomerListResModel>();
  Stream<CustomerListResModel> get customerListsApi => _fetchCustomerListsApi.stream;
  fetchCustomerListsApi() async {
    CustomerListResModel model = await _repository.fetchCustomerListsApi();
    _fetchCustomerListsApi.sink.add(model);
  }


  //Order
  final _fetchOrder = PublishSubject<OrdersResModel>();
  Stream<OrdersResModel> get ordersApi => _fetchOrder.stream;
  fetchOrdersApi(String fromDate, String toDate) async {
    OrdersResModel model = await _repository.fetchOrdersApi(fromDate, toDate);
    _fetchOrder.sink.add(model);
  }


  //Items
  final _fetchItems = PublishSubject<ProductResModel>();
  Stream<ProductResModel> get itemsApi => _fetchItems.stream;
  fetchItemsApi() async {
    ProductResModel model = await _repository.fetchItemsApi();
    _fetchItems.sink.add(model);
  }


  //Offers
  final _fetchOffers = PublishSubject<OffersResModel>();
  Stream<OffersResModel> get offerApi => _fetchOffers.stream;
  fetchOffersApi() async {
    OffersResModel model = await _repository.fetchOffersApi();
    _fetchOffers.sink.add(model);
  }


  //Review
  final _fetchReview = PublishSubject<ReviewsResModel>();
  Stream<ReviewsResModel> get reviewApi => _fetchReview.stream;
  fetchReviewApi() async {
    ReviewsResModel model = await _repository.fetchReviewApi();
    _fetchReview.sink.add(model);
  }


  //Sales Api
  final _fetchSales = PublishSubject<SalesResModel>();
  Stream<SalesResModel> get salesApi => _fetchSales.stream;
  fetchSalesApi() async {
    SalesResModel model = await _repository.fetchSalesApi();
    _fetchSales.sink.add(model);
  }


  // Customer order Api
  final _fetchCustomerOrdersApi = PublishSubject<CustomerOrdersResModel>();
  Stream<CustomerOrdersResModel> get customerOrdersApi => _fetchCustomerOrdersApi.stream;
  fetchCustomerOrdersApi(String customerId) async {
    CustomerOrdersResModel model = await _repository.fetchCustomerOrdersApi(customerId);
    _fetchCustomerOrdersApi.sink.add(model);
  }


  //Delete Customer Api
  final _fetchDeleteCustomerApi = PublishSubject<StatusMsgResModel>();
  Stream<StatusMsgResModel> get deleteCustomerApi => _fetchDeleteCustomerApi.stream;
  fetchDeleteCustomerApi(String customerId) async {
    StatusMsgResModel model = await _repository.fetchDeleteCustomerApi(customerId);
    _fetchDeleteCustomerApi.sink.add(model);
  }

  //PickUp
  final _fetchPickUpListsApi = PublishSubject<PickUpResModel>();
  Stream<PickUpResModel> get pickUpListsApi => _fetchPickUpListsApi.stream;
  fetchPickUpListsApi(String fromDate, String toDate) async {
    PickUpResModel model = await _repository.fetchPickUpListsApi(fromDate, toDate);
    _fetchPickUpListsApi.sink.add(model);
  }


  //DropOff Lists Api
  final _fetchDropOffListsApi = PublishSubject<PickUpResModel>();
  Stream<PickUpResModel> get dropOffListsApi => _fetchDropOffListsApi.stream;
  fetchDropOffListsApi(String fromDate, String toDate) async {
    PickUpResModel model = await _repository.fetchDropOffListsApi(fromDate, toDate);
    _fetchDropOffListsApi.sink.add(model);
  }


  dispose() {
    //Close the api fetcher
    _loginResFetcher.close();
    _fetchUpdateDeviceTokenFetcher.close();
    _fetchCustomerListsApi.close();
    _fetchItems.close();
    _fetchOrder.close();
    _fetchOffers.close();
    _fetchReview.close();
    _fetchSales.close();
    _fetchDeleteCustomerApi.close();
    _fetchCustomerOrdersApi.close();
    _fetchPickUpListsApi.close();
    _fetchDropOffListsApi.close();
  }
}

final apiBloc = ApiBloc();
