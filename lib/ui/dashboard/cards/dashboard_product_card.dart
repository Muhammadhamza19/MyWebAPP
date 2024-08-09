import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class DashboardProductCard extends StatelessWidget {
  final AllProducts allProduct;
  Function()? onTap;
  DashboardProductCard({required this.allProduct, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          hGap16,
          Padding(
            padding: EdgeInsets.only(right: 10, left: 5, top: 10, bottom: 10),
            child: Card(
              color: isDark ? secondaryColor : backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hGap12,
                    MyAssetImage(
                      imageName: allProduct.image ?? "",
                      height: 120,
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              allProduct.productName ?? "",
                              style: titleSmall,
                              maxLines: 2,
                            ),
                            hGap12,
                            MyText(
                              allProduct.storeName ?? "",
                              style: labelLarge,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            RatingComponent(
                              currentRating: allProduct.currentRating,
                              maxRating: 5,
                              textRightSide: true,
                            ),
                            hGap8,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
