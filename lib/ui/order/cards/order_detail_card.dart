import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class OrderDetailCard extends StatelessWidget {
  final OrderDetailResponse orderDetail;
  Function()? onTap;
  OrderDetailCard({required this.orderDetail, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyAssetImage(
                              imageName: orderDetail.productImage ?? "",
                              height: 50,
                              width: 50,
                            ),
                            wGap20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "${orderDetail.productName}",
                                  style: labelLarge,
                                ),
                                MyText(
                                  "${orderDetail.storeName}",
                                ),
                                MyText(
                                  "${orderDetail.quantityDetail}",
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      "quantity",
                                      style: labelLarge,
                                    ),
                                    wGap4,
                                    MyText(
                                      "${orderDetail.quantity}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      MyText(
                        "${orderDetail.currency} ${orderDetail.price}",
                        style: primarySmall,
                      )
                    ],
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
