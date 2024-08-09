import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/product/view/bundle_promotion_product_view.dart';
import 'package:local_grocery/ui/product/view/product_description_view.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class ProductMainPage extends StatelessWidget {
  late ProductViewModel _model;
  final int? promotionType;
  final int? productId;
  final String? productTitle;
  ProductMainPage({
    this.productTitle,
    this.promotionType,
    this.productId = 0,
  });

  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
      init: ProductViewModel(ProductCurrentView.product.index,
          promotionType: promotionType),
      dispose: (_) => Get.find<ProductViewModel>().onClose(),
      builder: (model) {
        _model = model;
        return BaseScaffoldScreen(
          automaticallyImplyLeading: false,
          appBar: _appBar(),
          body: RefreshIndicator(
            onRefresh: () => _model.fetchData(ProductCurrentView.product.index,
                promotionType: promotionType),
            child: Obx(
              () {
                if (_model.isLoading) {
                  return _loadingContent();
                }

                if (_model.isError) {
                  return ErrorView(
                    _model.errorMessage.value,
                    refreshFunction: () => _model.fetchData(
                        ProductCurrentView.product.index,
                        promotionType: promotionType),
                  );
                }

                return model.shouldNotify.value
                    ? _pageContent(context, _model)
                    : const SizedBox();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _appBar() {
    return MyAppBar(
      title: productTitle ?? "",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _loadingContent() {
    return ShimmerWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Card(
                    color: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: MyText(
                        "Available",
                        style: TextStyle(
                          color: backgroundColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  hGap4,
                  Box.text(
                    fontSize: 15,
                    explicitWidth: 60,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Card(
                    child: SizedBox(
                  width: 150,
                  height: 150,
                )),
                Expanded(
                  child: Column(
                    children: [
                      Box.text(
                        fontSize: 15,
                      ),
                      hGap4,
                      Box.text(
                        fontSize: 15,
                      ),
                      hGap4,
                      Box.text(
                        fontSize: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
            hGap4,
            Box.text(
              fontSize: 15,
            ),
            hGap4,
            Box.text(
              fontSize: 15,
            ),
            hGap4,
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _pageContent(BuildContext context, ProductViewModel _model) {
    return promotionType == null || promotionType == 1
        ? ProductDescriptionView()
        : BundlePromotionProductView();
  }
}
