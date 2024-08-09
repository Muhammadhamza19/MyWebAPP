import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class DashboardStoreDealCard extends StatelessWidget {
  final StoreDeal storeDeal;
  Function()? onTap;
  DashboardStoreDealCard({required this.storeDeal, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 5, top: 10, bottom: 10),
            child: Card(
              color: isDark ? secondaryColor : backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyAssetImage(
                            imageName: storeDeal.image ?? "",
                            width: 50,
                            height: 50,
                          ),
                          wGap28,
                          SizedBox(
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  storeDeal.storeName ?? "",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                ),
                                hGap8,
                                MyText(
                                  storeDeal.discountOffer ?? "",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  maxLines: 1,
                                ),
                                hGap8,
                                MyText(
                                  storeDeal.dealDesc1 ?? "",
                                  style: Theme.of(context).textTheme.labelSmall,
                                  maxLines: 1,
                                ),
                                hGap4,
                                MyText(
                                  storeDeal.dealDesc2 ?? "",
                                  style: Theme.of(context).textTheme.labelSmall,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // hGap12,
                      Spacer(),
                      SizedBox(
                        width: 270,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingComponent(
                              currentRating: storeDeal.currentRating,
                              maxRating: 4,
                            ),
                            // wGap32,
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: borderColor,
                                  size: 15,
                                ),
                                wGap4,
                                MyText(
                                  storeDeal.martDistance ?? "",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                // wGap4,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
