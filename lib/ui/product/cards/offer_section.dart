import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class OfferSection extends StatelessWidget {
  ProductViewModel? model;
  OfferSection({this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          "Offer",
          style: titleSmall,
        ),
        hGap12,
        MyText(
          model?.product.offer ?? "",
          style: titleMedium,
        ),
        hGap12,
        MyText(
          model?.product.dealEnd ?? "",
          style: TextStyle(
            color: redColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
