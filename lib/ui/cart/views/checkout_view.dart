import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/cart/cards/checkout_product_card.dart';
import 'package:local_grocery/ui/cart/cards/delivery_information_card.dart';
import 'package:local_grocery/ui/cart/cards/payment_info_card.dart';
import 'package:local_grocery/ui/cart/cards/shipping_details_card.dart';
import 'package:local_grocery/ui/cart/views/payment_view.dart';
import 'package:local_grocery/ui/main_page.dart';
import 'package:local_grocery/ui/order/views/order_placed_view.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/view_models/cart_view_model.dart';
import 'package:local_grocery/view_models/user_view_model.dart';

class CheckoutView extends StatelessWidget {
  final _model = Get.find<CartViewModel>();
  CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      // bottomNavigationBar: _bottomNavigationBar(),
      appBar: _appBar(),
      body: Obx(
        () {
          /// Show loader during page load
          if (_model.isLoading) {
            // return LoaderView();
            return _loadingContent();
          }

          /// Show error state
          if (_model.isError) {
            return ErrorView(
              _model.errorMessage.value,
              refreshFunction: () => _model.fetchData(),
            );
          }

          /// show page content
          return Obx(
            () => (_model.shouldNotify.value)
                ? _pageContent(context)
                : const SizedBox(),
          );
        },
      ),
    );
  }

  /// this method will contain view for shimmer
  Widget _loadingContent() {
    return ShimmerWidget(
      child: LoadingListView(
        child: LoadingListTile(),
      ),
    );
  }

  Widget _appBar() {
    return MyAppBar(
      // title: "dashboard",

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
            color: primaryColor,
            iconSize: 20,
          ),
          MyText(
            'CheckOut',
            style: primaryMedium,
          ),
          wGap4,
        ],
      ),
    );
  }

  /// this method will always use to populate page data
  Widget _pageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          hGap16,
          ListView.builder(
            shrinkWrap: true,
            itemCount: _model.cart.productList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckoutProductCard(
                index: index,
                deleteOnPressed: () {
                  _model.deleteCardItem(_model.cart.productList[index]);
                  _model.notify();
                },
                cart: _model.cart,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
          ),
          DeliveryInformation(),
          hGap12,
          GestureDetector(
            onTap: () => Get.to(() => PaymentView()),
            child: PaymentInfoCard(),
          ),
          hGap12,
          ShippingDetailsCard(),
          hGap12,
          Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: MyText(
                        "Sub Total",
                        style: titleSmall,
                      ),
                    ),
                    wGap24,
                    MyText(
                      "${_model.cart.productList.map((product) => product.totalPrice).fold(0.0, (sum, totalPrice) => sum + (totalPrice ?? 0.0)).toStringAsFixed(2)}",
                      style: labelLarge,
                    )
                  ],
                ),
                MyButton(
                  text:
                      "Place Order (${_model.cart.productList.map((product) => product.quantity).fold(0, (sum, quantity) => sum + (quantity ?? 0))})",
                  onPressed: () {
                    if (UserViewModel().isAlreadyLogin) {
                      Get.to(
                        () => OrderPlacedView(),
                      );
                    } else {
                      UserViewModel.load().currentView.value =
                          EMainCurrentView.selection_view.index;
                      print(UserViewModel().currentView.value);
                      Get.to(
                        () => MainPage(),
                      );
                    }
                  },
                  fullWidth: true,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
