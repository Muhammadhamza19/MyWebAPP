import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/cart/views/voucher_view.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class ProductQuantityCard extends StatelessWidget {
  int? index;
  Cart? cart;
  VoidCallback? deleteQuantity;
  VoidCallback? addQuantity;

  VoidCallback? deleteOnPressed;

  ProductQuantityCard({
    this.index,
    this.cart,
    this.deleteQuantity,
    this.addQuantity,
    this.deleteOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? secondaryColor : backgroundColor,
      elevation: 5,
      child: Row(
        children: [
          hGap12,
          Column(
            children: [
              MyAssetImage(
                imageName: cart?.productList[index ?? 0].image ?? "",
                height: 120,
                width: 120,
              ),
              hGap12,
              Row(
                children: [
                  IconButton(
                    onPressed: deleteQuantity,
                    icon: const Icon(FontAwesomeIcons.squareMinus),
                    color: primaryColor,
                  ),
                  MyText(
                    "${cart?.productList[index ?? 0].quantity}",
                  ),
                  IconButton(
                    onPressed: addQuantity,
                    icon: const Icon(FontAwesomeIcons.squarePlus),
                    color: primaryColor,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      cart?.productList[index ?? 0].name ?? "",
                      style: labelLarge,
                    ),
                    hGap4,
                    MyText(
                      cart?.productList[index ?? 0].store ?? "",
                      style: labelMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      "${cart?.productList[index ?? 0].currency} ${cart?.productList[index ?? 0].discountedPrice}",
                      style: primarySmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, right: 5.0),
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
                  padding: const EdgeInsets.only(top: 2.0, right: 5.0),
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
                  padding: const EdgeInsets.only(top: 2.0, right: 5.0),
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
                MyText(
                  "FREE Returns",
                ),
                MyText(
                  "In Stock",
                  style: cart?.productList[index ?? 0].available == true
                      ? TextStyle(color: primaryColor)
                      : null,
                ),
                Center(
                  child: MyButton(
                    text: "Clip & Save up to \$2.00",
                    color: primaryColor,
                    fullWidth: true,
                    onPressed: () {
                      Get.to(
                        () => VoucherView(),
                      );
                    },
                  ),
                ),
                hGap4,
                MyText(
                  "Conditions Apply",
                ),
                hGap4,
                ProgressionButtonView(
                  progressionButtons: [
                    ProgressionButton(
                      text: 'Delete',
                      icon: FontAwesomeIcons.trashCan,
                      onPressed: deleteOnPressed,
                      color: redColor[400],
                    ),
                    ProgressionButton(
                      text: 'Save For Later',
                      icon: FontAwesomeIcons.bookmark,
                      onPressed: () {},
                      color: primaryColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
