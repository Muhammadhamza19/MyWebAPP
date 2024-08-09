import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  Function()? onTap;
  OrderCard({required this.order, this.onTap});

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            MyText("tokenId"),
                            MyText(
                              "${order.tokenId}",
                              style: titleSmall,
                            ),
                          ],
                        ),
                        MyText(
                          "${order.currency} ${order.price}",
                          style: primarySmall,
                        )
                      ],
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          MyText(
                            "status",
                            style: labelLarge,
                          ),
                          MyText("${order.status}"),
                        ],
                      ),
                      Column(
                        children: [
                          MyText(
                            "deliveryMethod",
                            style: labelLarge,
                          ),
                          MyText("${order.deliveryMethod}"),
                        ],
                      ),
                      Column(
                        children: [
                          MyText(
                            "date",
                            style: labelLarge,
                          ),
                          MyText("${order.orderDate}"),
                        ],
                      ),
                    ],
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
