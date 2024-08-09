// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_bestseller_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_product_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_promotion_card.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/product/product_main_page.dart';
import 'package:local_grocery/ui/shared/components/arrow_card.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class StoreMainPage extends StatelessWidget {
  final String? storeTitle;
  final int storeId;
  StoreMainPage({
    Key? key,
    this.storeTitle,
    required this.storeId,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
      init: ProductViewModel(ProductCurrentView.store.index),
      dispose: (_) => Get.find<ProductViewModel>().onClose(),
      builder: (_model) {
        return BaseScaffoldScreen(
          appBar: MyAppBar(
            title: storeTitle ?? "",
          ),
          body: Obx(
            () {
              /// Show loader during page load
              if (_model.isLoading) {
                // return LoaderView();
                return _loadingContent();
              }

              /// Show error state
              if (_model.isError) {
                return ErrorView(_model.errorMessage.value,
                    refreshFunction: () =>
                        _model.fetchData(ProductCurrentView.store.index));
              }

              /// show page content
              return RefreshIndicator(
                onRefresh: () =>
                    _model.fetchData(ProductCurrentView.store.index),
                child: Obx(
                  () => (_model.shouldNotify.value)
                      ? _pageContent(
                          context,
                          _model,
                        )
                      : const SizedBox(),
                ),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hGap16,

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
            hGap16, hGap16,
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
          ],
        ),
      ),
    );
  }

  Widget _pageContent(BuildContext context, ProductViewModel _model) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              cardsHeadings(
                text1: "Promotions",
                text2: "See all",
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _model.promotion?.length,
                  itemBuilder: (context, index) {
                    return DashboardPromotionCard(
                      promotion: _model.promotion![index],
                    );
                  },
                ),
              ),
              cardsHeadings(
                text1: "Best Seller",
                text2: "See all",
              ),
              _bestSellerCard(
                _model,
              ),
              hGap8,
              hGap8,
              cardsHeadings(
                text1: "All Products",
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
                  itemCount: _model.allProducts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DashboardProductCard(
                        allProduct: _model.allProducts![index]);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _bestSellerCard(ProductViewModel _model) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.bestSeller?.length,
        itemBuilder: (context, index) {
          return DashboardBestSellerCard(
            bestSeller: _model.bestSeller![index],
            onTap: () async {
              await Get.to(
                () => ProductMainPage(
                  productId: _model.allProducts![index].productId,
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

  Widget cardsHeadings({void Function()? onTap, String? text1, String? text2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ArrowCard(
          width: 180,
          text: text1 ?? "",
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
}
