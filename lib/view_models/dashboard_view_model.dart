import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';

import 'package:local_grocery/repositories/dashboard_repository.dart';
import 'package:local_grocery/support/config/app_shared_pref.dart';
import 'package:local_grocery/view_models/base_view_model.dart';

enum DMainCurrentView {
  filter_view,
  cart_view,
  search_view,
  dashboard_view,
}

class DashboardViewModel extends BaseViewModel {
  final _repository = DashboardRepository();
  RxInt employeeId = 0.obs;
  RxInt applicationTypeIndex = 0.obs;
  List<Category>? category;
  List<StoreDeal>? storeDeal;
  List<Promotion>? promotion;

  List<BestSeller>? bestSeller;
  Rx<RangeValues> rangeValues = RangeValues(0, 100).obs;
  RxDouble distanceSliderValue = 0.0.obs;

  List<AllProducts>? allProducts;
  List<SearchProducts>? searchProducts;
  RxInt currentView = DMainCurrentView.dashboard_view.index.obs;
//Cart View
  Cart? cart;

  RxBool checkboxValue = false.obs;
  RxBool checkboxValue1 = false.obs;

  RxDouble price = 0.0.obs;

  DashboardViewModel() {
    fetchData();
  }
  void updatePriceSliderValue(RangeValues values) {
    rangeValues.value = values;
  }

  void updateDistanceSliderValue(double value) {
    distanceSliderValue.value = value;
  }

  /// load view model
  static DashboardViewModel load({shouldFetchData = false}) {
    if (!Get.isRegistered<DashboardViewModel>()) {
      return Get.put(
        DashboardViewModel(),
      );
    } else {
      final viewModel = Get.find<DashboardViewModel>();
      shouldFetchData ? viewModel.fetchData() : null;
      return viewModel;
    }
  }

  /// common methods
  Future<void> fetchData() async {
    setLoading();
    await Future.delayed(const Duration(seconds: 2));
    category = Category.getDummyCategorys();
    storeDeal = StoreDeal.getDummyStoreDeal();
    promotion = Promotion.getDummyPromotion();

    allProducts = AllProducts.getDummyAllProducts();
    bestSeller = BestSeller.getDummySeller();
    employeeId.value = AppSharedPref.getUserId();
    cart = Cart();
    setComplete();
  }

  /// toggle filter
  void toggleDashboardFilterView(bool _isDashBoardFilterView) {
    if (_isDashBoardFilterView) {
      currentView.value = DMainCurrentView.dashboard_view.index;
    } else {
      currentView.value = DMainCurrentView.filter_view.index;
    }
  }

  void toggleDashboardSearchView(bool _isDashBoardSearchView) {
    if (_isDashBoardSearchView) {
      currentView.value = DMainCurrentView.dashboard_view.index;
    } else {
      currentView.value = DMainCurrentView.search_view.index;
    }
  }

  void toggleDashboardCartView(bool _isDashBoardCartView) {
    if (_isDashBoardCartView) {
      currentView.value = DMainCurrentView.dashboard_view.index;
    } else {
      currentView.value = DMainCurrentView.cart_view.index;
    }
  }

  void get showDashboard =>
      currentView.value = DMainCurrentView.dashboard_view.index;

  /// add to cart
  void addToCart({Product? product, BundlePromotion? bundlePromotion}) {
    if (product != null) {
      cart?.productList.add(product);
      product.totalPrice = (product.discountedPrice ?? 0.0) +
          (product.hst ?? 0.0) +
          (product.enviromentFees ?? 0.0) +
          (product.recycleFees ?? 0.0);
    } else if (bundlePromotion != null) {
      cart?.bundlePromotionList.add(bundlePromotion);
      bundlePromotion.totalPrice = (bundlePromotion.discountedPrice ?? 0.0) +
          (bundlePromotion.hst ?? 0.0) +
          (bundlePromotion.enviromentFees ?? 0.0) +
          (bundlePromotion.recycleFees ?? 0.0);
    }
  }

  Future<void> searchProduct(String searchedItems) async {
    searchProducts = await SearchProducts.getDummyAllProducts();
  }

  /// getters
  bool get hasCart =>
      (cart?.productList.isNotEmpty ?? false) ||
      (cart?.bundlePromotionList.isNotEmpty ?? false);

  int get cartCount => ((cart?.productList.length ?? 0) +
      (cart?.bundlePromotionList.length ?? 0));
}
