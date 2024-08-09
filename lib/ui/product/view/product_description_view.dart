import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';

import 'package:local_grocery/ui/cart/cart_main_page.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/product/cards/offer_section.dart';
import 'package:local_grocery/ui/product/cards/online_exclusive_card.dart';
import 'package:local_grocery/ui/product/cards/product_image_card.dart';
import 'package:local_grocery/ui/product/cards/product_reviews_list.dart';
import 'package:local_grocery/ui/shared/components/dialog_button.dart';

import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_bottom_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class ProductDescriptionView extends StatelessWidget {
  ProductViewModel model = Get.find<ProductViewModel>();
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _productStatus(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Show product image
                        ProductImageCard(
                          model: model,
                        ),
                        hGap12,

                        /// Show product rating
                        _ratingComponent(model),
                        hGap32,

                        /// Show offer section
                        OfferSection(
                          model: model,
                        ),
                        hGap12,

                        /// Show online exclusive card
                        OnlineExclusiveCard(),
                        hGap12,
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Show product details
                        _productDetails(model),
                        hGap12,

                        /// Show add to cart section
                        _addToCartSection(context, model.product),
                        hGap8,

                        /// Show product description
                        _productDescription(model),
                        hGap8,

                        /// Show product ingredients
                        _productIngredients(model),
                      ],
                    ),
                  ),
                ],
              ),

              /// Show product reviews header
              _productReviewsHeader(),

              /// Show product reviews
              ProductReviewsList(
                model: model,
              ),
            ],
          ),
        ),

        /// Show cart info if quantity is not 0
        if (DashboardViewModel.load().hasCart) ...[
          Align(
            alignment: Alignment.bottomCenter,
            child: _currentCartInfo(),
          ),
        ],
      ],
    );
  }

  Widget _productStatus() {
    return Align(
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
          MyText(
            "In Stock",
            style: TextStyle(
              color: greenColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ratingComponent(ProductViewModel model) {
    return RatingComponent(
      currentRating: model.product.productRating,
      onRatingChanged: (value) {},
    );
  }

  Widget _productDetails(ProductViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          model.product.name ?? "",
          style: titleSmall,
        ),
        hGap12,
        MyText(
          model.product.store ?? "",
          style: labelMedium,
        ),
        hGap12,
        MyText(
          "Quantity",
          style: titleSmall,
        ),
        MyText(
          "${model.product.quantity}",
          style: labelMedium,
        ),
        hGap12,
        MyText(
          "Price",
          style: titleSmall,
        ),
        Row(
          children: [
            MyText(
              "${model.product.currency} ${model.product.originalPrice}",
              style: model.product.discountedPrice != 0.0
                  ? TextStyle(
                      color: isDark ? backgroundColor : secondaryColor,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 5,
                    )
                  : labelLarge,
            ),
            wGap4,
            if (model.product.discountedPrice != 0.0)
              MyText(
                "${model.product.currency} ${model.product.discountedPrice}",
                style: TextStyle(
                  color: greenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _addToCartSection(BuildContext context, Product product) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        MyButton(
          text: "addtoCart",
          iconData: Icons.shopping_cart,
          iconSize: 15,
          iconPosition: IconPosition.start,
          textColor: backgroundColor,
          color: primaryColor,
          onPressed: () {
            DashboardViewModel.load().addToCart(product: product);
            model.notify();
          },
        ),
        wGap4,
        MyText(
          "${product.piecesAvailable} Pieces Available",
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _productDescription(ProductViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          "description",
          style: titleSmall,
        ),
        hGap4,
        MyText(
          model.product.description ?? "",
        ),
      ],
    );
  }

  Widget _productIngredients(ProductViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          "ingredients",
          style: titleSmall,
        ),
        hGap4,
        MyText(
          model.product.ingredients ?? "",
        ),
      ],
    );
  }

  Widget _productReviewsHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: MyText(
          "productReviews",
          style: TextStyle(color: borderColor),
        ),
      ),
    );
  }

  Widget _currentCartInfo() {
    final productList = DashboardViewModel.load().cart?.productList ?? [];
    final bundlePromotionList =
        DashboardViewModel.load().cart?.bundlePromotionList ?? [];

// Combine the lists
    final combinedList = [...productList, ...bundlePromotionList];

// Calculate total quantity
    final totalQuantity = combinedList.map((item) {
      if (item is Product) {
        // Assuming Product is the type for productList items
        return item.quantity;
      } else if (item is BundlePromotion) {
        // Assuming BundlePromotion is the type for bundlePromotionList items
        return item.quantity;
      }
      return 0;
    }).fold(0, (sum, quantity) => sum + (quantity ?? 0));

// Calculate total discounted price
    final totalDiscountedPrice = combinedList.map((item) {
      if (item is Product) {
        // Assuming Product is the type for productList items
        return item.discountedPrice;
      } else if (item is BundlePromotion) {
        // Assuming BundlePromotion is the type for bundlePromotionList items
        return item
            .discountedPrice; // Adjust this if the property has a different name
      }
      return 0.0;
    }).fold(0.0, (sum, discountedPrice) => sum + (discountedPrice ?? 0.0));

    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyBottomButton(
          buttonText: "View Your Cart",
          color: primaryColor,
          text1: "$totalQuantity",
          text2: "$totalDiscountedPrice",
          fullWidth: true,
          onPressed: () {
            Get.to(() => CartMainPage(), transition: Transition.downToUp);
          },
        ),
      ),
    );
  }
}
