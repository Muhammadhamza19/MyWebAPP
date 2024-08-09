import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/arrow_card.dart';
import 'package:local_grocery/ui/shared/components/multiple_image_component.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';
import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class DashboardPromotionCard extends StatelessWidget {
  final Promotion promotion;
  Function()? onTap;
  DashboardPromotionCard({required this.promotion, this.onTap});

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
              // Adjust elevation to match the box shadow effect
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Wrap(
                      spacing: 25,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        ArrowCard(
                          text: promotion.discountOffer,
                          color: secondaryColor,
                        ),
                        wGap32,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingComponent(
                              currentRating: promotion.currentRating,
                              maxRating: 5,
                              textRightSide: true,
                            ),
                            hGap8,
                            Row(
                              children: [
                                MyText(
                                  promotion.martDistance ?? "",
                                  style: labelSmall,
                                ),
                                wGap4,
                                Icon(
                                  Icons.location_pin,
                                  color: borderColor,
                                  size: 15,
                                ),
                                wGap4,
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // hGap12,
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          promotion.offerLeftHeading ?? "",
                          style: labelSmall,
                        ),
                        MyText(
                          promotion.offerLeft ?? "",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 11, color: redColor),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                promotion.bundleName != null
                                    ? promotion.bundleName ?? ""
                                    : promotion.products?[0].productName ?? "",
                                style: titleSmall,
                                maxLines: 1,
                              ),
                              hGap12,
                              MyText(
                                promotion.storeName ?? "",
                                style: labelLarge,
                                textAlign: TextAlign.left,
                              ),
                              hGap8,
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                    size: 13,
                                  ),
                                  MyText(
                                    promotion.stockDescription ?? "",
                                    style: labelLarge,
                                  ),
                                ],
                              ),
                              hGap8,
                              Row(
                                children: [
                                  MyText(
                                    promotion.orignalRate ?? "",
                                    style: promotion.discountlRate!.isNotEmpty
                                        ? TextStyle(
                                            color: isDark
                                                ? backgroundColor
                                                : secondaryColor,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Colors.red,
                                            decorationThickness: 5)
                                        : labelLarge,
                                  ),
                                  wGap4,
                                  if (promotion.discountlRate!.isNotEmpty) ...[
                                    MyText(
                                      promotion.discountlRate ?? "",
                                      style: TextStyle(
                                        color: greenColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                        MultipleImageComponent(
                          texts: [
                            for (int index = 0;
                                index < (promotion.products?.length ?? 0);
                                index++) ...[
                              promotion.products?[index].productName ?? "",
                            ]
                          ],
                          images: [
                            for (int index = 0;
                                index < (promotion.products?.length ?? 0);
                                index++) ...[
                              promotion.products?[index].image ?? "",
                            ]
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
