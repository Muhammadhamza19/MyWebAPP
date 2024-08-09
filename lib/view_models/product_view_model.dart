import 'package:get/get.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/view_models/base_view_model.dart';

enum ProductCurrentView {
  promotion,
  product,
  store,
  order,
  transaction,
}

class ProductViewModel extends BaseViewModel {
  List<Promotion>? promotion;
  List<AllProducts>? allProducts;
  List<BestSeller>? bestSeller;
  List<Order>? orders;
  // List<OrderDetailResponse>? ordersDetails;
  BundlePromotion? bundlePromotion;
  late Product product;
  RxInt imageIndex = 0.obs;
  ProductViewModel(int currentview, {int? promotionType}) {
    fetchData(currentview, promotionType: promotionType);
  }

  /// common methods
  Future<void> fetchData(int currentview, {int? promotionType}) async {
    setLoading();

    if (ProductCurrentView.store.index == currentview) {
      bestSeller = BestSeller.getDummySeller();
      promotion = Promotion.getDummyPromotion();
      allProducts = AllProducts.getDummyAllProducts();
    } else if (ProductCurrentView.product.index == currentview) {
      if (promotionType == 1 || promotionType == null) {
        product = Product.dummyData();
      } else {
        product = Product.dummyData();

        bundlePromotion = await BundlePromotion.dummyData();

        print(bundlePromotion?.currency);
      }
    }

    await Future.delayed(const Duration(seconds: 5));

    setComplete();
  }
}
