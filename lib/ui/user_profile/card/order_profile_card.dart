import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/arrow_card.dart';
import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class OrderProfileCard extends StatelessWidget {
  final OrderList orderList;
  Function()? onTap;
  OrderProfileCard({required this.orderList, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // hGap16,
          Padding(
            padding: EdgeInsets.only(right: 10, left: 5, top: 10, bottom: 10),
            child: Card(
              color: isDark ? secondaryColor : backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3, // Adjust elevation to match the box shadow effect
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 325,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ArrowCard(
                            text: orderList.discountOffer,
                            color: secondaryColor,
                          ),
                          wGap32,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingComponent(
                                currentRating: orderList.currentRating,
                                maxRating: 5,
                                textRightSide: true,
                              ),
                              hGap8,
                              Row(
                                children: [
                                  MyText(
                                    orderList.martDistance ?? "",
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
                  ),
                  // hGap12,
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          orderList.offerLeftHeading ?? "",
                          style: labelSmall,
                        ),
                        MyText(
                          orderList.offerLeft ?? "",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 11, color: redColor),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                orderList.productName ?? "",
                                style: titleSmall,
                                maxLines: 1,
                              ),
                              hGap12,
                              MyText(
                                orderList.storeName ?? "",
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
                                    orderList.stockDescription ?? "",
                                    style: labelLarge,
                                  ),
                                ],
                              ),
                              hGap8,
                              Row(
                                children: [
                                  MyText(
                                    orderList.orignalRate ?? "",
                                    style: orderList.discountlRate!.isNotEmpty
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
                                  if (orderList.discountlRate!.isNotEmpty) ...[
                                    MyText(
                                      orderList.discountlRate ?? "",
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
                        MyAssetImage(
                          imageName: orderList.image ?? "",
                          height: 160,
                          width: 160,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
