import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class CheckoutProductCard extends StatelessWidget {
  int? index;
  Cart? cart;

  VoidCallback? deleteOnPressed;

  CheckoutProductCard({
    this.index,
    this.cart,
    this.deleteOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? secondaryColor : backgroundColor,
      elevation: 5,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  cart?.productList[index ?? 0].name ?? "",
                  style: labelLarge,
                ),
                MyText(
                  cart?.productList[index ?? 0].store ?? "",
                  style: labelMedium,
                ),
                MyText(
                  "${cart?.productList[index ?? 0].currency} ${cart?.productList[index ?? 0].discountedPrice}",
                  style: primarySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  'environmentFees',
                  style: labelLarge,
                ),
                MyText(
                  "${cart?.productList[index ?? 0].enviromentFees} ${cart?.productList[index ?? 0].currency}",
                  style: primarySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  "recycleFees",
                  style: labelLarge,
                ),
                MyText(
                  "${cart?.productList[index ?? 0].recycleFees} ${cart?.productList[index ?? 0].currency}",
                  style: primarySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  "HST",
                  style: labelLarge,
                ),
                MyText(
                  "${((cart?.productList[index ?? 0].hst ?? 0) * 100).toStringAsFixed(0)} %",
                  style: primarySmall,
                ),
              ],
            ),
          ),
          ProgressionButtonView(
            progressionButtons: [
              ProgressionButton(
                text: 'Delete',
                icon: FontAwesomeIcons.trashCan,
                onPressed: deleteOnPressed,
                color: redColor[400],
              ),
            ],
          )
        ],
      ),
    );
  }
}
