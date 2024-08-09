import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/view_models/base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  List<OrderList>? orderList;
  ProfileViewModel() {
    fetchData();
  }

  /// fetch from api
  Future<void> fetchData() async {
    setLoading();
    orderList = OrderList.getDummySeller();
    await Future.delayed(const Duration(seconds: 5));

    setComplete();
  }
}
