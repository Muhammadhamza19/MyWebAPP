import 'package:local_grocery/view_models/base_view_model.dart';

class ChatViewModel extends BaseViewModel {
  ChatViewModel() {
    fetchData();
  }

  /// fetch from api
  Future<void> fetchData() async {
    setLoading();

    await Future.delayed(const Duration(seconds: 5));

    setComplete();
  }
}
