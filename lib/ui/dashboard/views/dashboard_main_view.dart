import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/ui/cart/cart_main_page.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_bestseller_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_product_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_category_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_promotion_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_store_deal_card.dart';
import 'package:local_grocery/ui/dashboard/views/drawer_methods.dart';
import 'package:local_grocery/ui/product/product_main_page.dart';
import 'package:local_grocery/ui/shared/components/arrow_card.dart';
import 'package:local_grocery/ui/shared/components/cart_icon_count.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/ui/shared/widgets/my_location_text.dart';
import 'package:local_grocery/ui/store/store_main_page.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_input_box.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';
import 'package:local_grocery/view_models/user_view_model.dart';

class DashboardMainView extends StatelessWidget {
  final DashboardViewModel _model =
      DashboardViewModel.load(shouldFetchData: false);

  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Kiwi',
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        /// Show loader during page load
        if (_model.isLoading) {
          // return LoaderView();
          return _loadingContent();
        }

        /// Show error state
        if (_model.isError) {
          return ErrorView(_model.errorMessage.value,
              refreshFunction: _model.fetchData);
        }

        /// show page content
        return BaseScaffoldScreen(
          appBar: _appBar(_model),
          drawer: UserViewModel.load().isAlreadyLogin
              ? drawerAfterLogin()
              : drawerBeforeLogin(),
          body: RefreshIndicator(
            onRefresh: _model.fetchData,
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus =
                    FocusScope.of(_scaffoldKey.currentContext!);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild!.unfocus();
                }
              },
              child: _model.shouldNotify.value
                  ? _pageContent(context)
                  : const SizedBox(),
            ),
          ),
        );
      },
    );
  }

  /// this method will contain view for shimmer
  Widget _loadingContent() {
    return ShimmerWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hGap16,
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: LoadingInputBox(),
            ),

            hGap16,
            Box.text(fontSize: 15.0),
            hGap8,

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35,
                    ),
                  );
                },
              ),
            ),
            // categoryListItem(),
            hGap16,
            Box.text(fontSize: 15.0),
            hGap8,

            hGap8,
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: 250,
                      child: Box.text(
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
            hGap16,
            Box.text(fontSize: 15.0),
            hGap8,
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Box.text(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            hGap16,
            Box.text(fontSize: 15.0),
            hGap8,
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Box.text(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            hGap8,
            hGap16,
            Box.text(fontSize: 15.0),
            hGap8,
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300 // Adjust as needed
                  ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Box.text(
                    fontSize: 15,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(DashboardViewModel model) {
    return MyAppBar(
      // title: "dashboard",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  color: primaryColor,
                  size: 15,
                ),
                wGap4,
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LocationTextField(),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.notifications,
            color: borderColor,
            size: 20,
          ),
          CartIconCount(
            cartItemCount: model.cartCount,
            onPressed: () {
              model.toggleDashboardCartView(false);
            },
          ),
        ],
      ),
    );
  }

  /// this method will always use to populate page data
  Widget _pageContent(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              hGap16,
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyInputBox(
                        borderLabel: "what do you want to buy",
                        icon: Icons.search,
                        borderColor: primaryColor,
                        onTap: () => _model.toggleDashboardSearchView(false),
                      ),
                    ),
                    wGap4,
                    MyAssetImage(
                      imageName: 'filter_icon',
                      onClick: (p0) {
                        _model.toggleDashboardFilterView(false);
                      },
                    )
                  ],
                ),
              ),

              hGap16,

              _storeDealsCard(),

              hGap12,
              hGap16,

              // hGap8,
              _categoryCard(),
              // categoryListItem(),
              hGap16,
              hGap16,
              cardsHeadings(
                text1: "Promotions",
                text2: "See all",
              ),
              _promotionCard(),
              hGap8,
              hGap16,
              cardsHeadings(
                text1: "Best Seller",
                text2: "See all",
              ),
              _bestSellerCard(),

              hGap8,
              hGap16,

              cardsHeadings(
                text1: "New Products",
                text2: "",
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 300 // Adjust as needed
                    ),
                itemCount: _model.allProducts?.length,
                itemBuilder: (BuildContext context, int index) {
                  return DashboardProductCard(
                    allProduct: _model.allProducts?[index] ?? AllProducts(),
                    onTap: () async {
                      await Get.to(
                        () => ProductMainPage(
                          productTitle: _model.allProducts?[index].productName,
                          productId: _model.allProducts?[index].productId,
                        ),
                      );
                      _model.notify();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _promotionCard() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.promotion?.length,
        itemBuilder: (context, index) {
          return DashboardPromotionCard(
            promotion: _model.promotion![index],
            onTap: () async {
              await Get.to(
                () => ProductMainPage(
                  productId: _model.promotion?[index].promotionIndex,
                  productTitle: _model.promotion?[index].bundleName ??
                      _model.promotion?[index].products?[0].productName,
                  promotionType: _model.promotion?[index].promotionType,
                ),
              );
              _model.notify();
            },
          );
        },
      ),
    );
  }

  Widget _bestSellerCard() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.promotion?.length,
        itemBuilder: (context, index) {
          return DashboardBestSellerCard(
            bestSeller: _model.bestSeller![index],
            onTap: () async {
              await Get.to(
                () => ProductMainPage(
                  productId: _model.allProducts?[index].productId,
                  productTitle: _model.allProducts?[index].productName,
                ),
              );
              _model.notify();
              //setState(() {});
              //if (result != null) {

              //}
            },
          );
        },
      ),
    );
  }

  Widget _categoryCard() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.category?.length,
        itemBuilder: (context, index) {
          return DashboardCategoryCard(
            category: _model.category![index],
          );
        },
      ),
    );
  }

  Widget _storeDealsCard() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.storeDeal?.length,
        itemBuilder: (context, index) {
          return DashboardStoreDealCard(
            storeDeal: _model.storeDeal![index],
            onTap: () => Get.to(StoreMainPage(
                storeId: _model.storeDeal![index].id ?? 0,
                storeTitle: _model.storeDeal![index].storeName)),
          );
        },
      ),
    );
  }

  Widget cardsHeadings({void Function()? onTap, String? text1, String? text2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ArrowCard(
          text: text1 ?? "",
          width: 180,
          color: primaryColor,
        ),

        GestureDetector(
          onTap: onTap ?? null,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: MyText(
              text2 ?? "",
            ),
          ),
        ),
        // wGap4
      ],
    );
  }

  Widget get _title => MyText(
        "Dashboard",
      );
}
