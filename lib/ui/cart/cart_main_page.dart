import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/cart/cards/product_quantity_card.dart';
import 'package:local_grocery/ui/cart/views/checkout_view.dart';
import 'package:local_grocery/ui/main_page.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_location_text.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/view_models/cart_view_model.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';
import 'package:local_grocery/view_models/user_view_model.dart';

class CartMainPage extends StatelessWidget {
  late CartViewModel _model;
  CartMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(DashboardViewModel.load().cart ?? Cart(), Cards()),
      dispose: (_) => Get.find<CartViewModel>().onClose(),
      builder: (model) {
        _model = model;
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
      },
    );
  }

  /// this method will contain view for shimmer
  Widget _loadingContent() {
    return ShimmerWidget(
        child: Column(
      children: [
        Box.text(
          fontSize: 30,
        ),
        hGap4,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              width: double.maxFinite,
              height: 300,
            ),
          ),
        ),
        hGap16,
        Box.text(
          fontSize: 15,
        ),
        hGap4,
        Box(
          height: BoxSize.tenth,
        ),
      ],
    ));
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
              if (DashboardViewModel.load().currentView.value == 1) {
                DashboardViewModel.load().showDashboard;
              } else {
                Get.back();
              }
            },
            icon: Icon(FontAwesomeIcons.arrowLeft),
            color: primaryColor,
            iconSize: 20,
          ),
          MyText(
            'yourCart',
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
          Container(
            color: primaryColor[200],
            padding: EdgeInsets.all(5),
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  color: backgroundColor,
                ),
                wGap12,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocationTextField(),
                ),
              ],
            ),
          ),
          hGap16,
          ListView.builder(
            shrinkWrap: true,
            itemCount: _model.cart.productList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductQuantityCard(
                index: index,
                deleteOnPressed: () {
                  _model.deleteCardItem(_model.cart.productList[index]);
                  _model.notify();
                },
                cart: _model.cart,
                addQuantity: () {
                  _model.addQuantity(
                    _model.cart.productList[index],
                  );
                  _model.notify();
                },
                deleteQuantity: () {
                  _model.deleteQuantity(
                    _model.cart.productList[index],
                  );
                  _model.notify();
                },
              ),
            ),
          ),
          hGap16,
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
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
                        "Proceed to checkout (${_model.cart.productList.map((product) => product.quantity).fold(0, (sum, quantity) => sum + (quantity ?? 0))})",
                    onPressed: () {
                      if (UserViewModel().isAlreadyLogin) {
                        Get.to(
                          () => CheckoutView(),
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
                  hGap8,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
