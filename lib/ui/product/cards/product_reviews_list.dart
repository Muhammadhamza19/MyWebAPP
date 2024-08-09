import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class ProductReviewsList extends StatelessWidget {
  ProductViewModel? model;
  ProductReviewsList({this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model?.product.reviews?.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyAssetImage(
                        imageName: model?.product.reviews?[i].image ?? "",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Column(
                      children: [
                        MyText(model?.product.reviews?[i].reviewer ?? ""),
                        MyText(model?.product.reviews?[i].comment ?? ""),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RatingComponent(
                    textRightSide: true,
                    currentRating: model?.product.reviews?[i].rating,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
