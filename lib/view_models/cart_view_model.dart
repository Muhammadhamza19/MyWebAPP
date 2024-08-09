import 'package:get/get.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/view_models/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  Cart cart;
  Cards? card;
  List<CardDetail>? cardDetail;
  RxBool checkboxValue = false.obs;

  DateTime? selectedDate;
  CartViewModel(this.cart, this.card) {
    fetchData();
  }

  /// fetch from api
  Future<void> fetchData() async {
    setLoading();

    await Future.delayed(const Duration(seconds: 5));

    setComplete();
  }

  /// common methods
  void addQuantity(Product product) {
    product.quantity = (product.quantity ?? 0) + 1;
    calculateTotalPrice(product);
    notify();
  }

  void calculateTotalPrice(Product product) {
    double basePrice = (product.discountedPrice ?? 0) * (product.quantity ?? 0);
    product.totalPrice = basePrice +
        (product.hst ?? 0) +
        (product.recycleFees ?? 0) +
        (product.enviromentFees ?? 0);
  }

  // double getTotalPrice(Product product) {
  //   return product.fold(0, (sum, item) => sum + calculateTotalPrice(item));
  // }
  void deleteCardItem(Product product) {
    cart.productList.remove(product);
    notify();
  }

  void deleteQuantity(Product product) {
    product.quantity = (product.quantity ?? 0) - 1;
    calculateTotalPrice(product);
    notify();
  }

  void toggleDelivery() {
    cart.shouldSendGift = !(cart.shouldSendGift ?? true);
    notify();
  }

  void addCardDetail(CardDetail cardDetail) {
    card?.cardList.add(cardDetail);
  }

  /// getters
  bool get shouldSendGift => cart.shouldSendGift ?? false;
}
