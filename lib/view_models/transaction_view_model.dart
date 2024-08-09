import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/view_models/base_view_model.dart';

class TransactionViewModel extends BaseViewModel {
  List<Transaction>? transaction;
  TransactionViewModel() {
    fetchData();
  }

  /// fetch from api
  Future<void> fetchData() async {
    setLoading();
    transaction = Transaction.dummyData();
    await Future.delayed(const Duration(seconds: 5));

    setComplete();
  }
}
