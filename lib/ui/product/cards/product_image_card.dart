import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class ProductImageCard extends StatelessWidget {
  ProductViewModel? model;

  ProductImageCard({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? secondaryColor : backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyAssetImage(
          imageName: model?.product.image ?? "",
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
