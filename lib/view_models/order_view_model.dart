import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/view_models/base_view_model.dart';

class OrderViewModel extends BaseViewModel {
  List<Order>? orders;
  OrderViewModel() {
    fetchData();
  }

  /// fetch from api
  Future<void> fetchData() async {
    setLoading();
    orders = Order.dummyData();
    await Future.delayed(const Duration(seconds: 5));

    setComplete();
  }
}
