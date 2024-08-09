import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/cart_view_model.dart';

class DeliveryInformation extends StatelessWidget {
  final _model = Get.find<CartViewModel>();

  DeliveryInformation();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? secondaryColor : backgroundColor,
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyText(
              "deliveringInformation",
              style: titleSmall,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _model.shouldSendGift,
                onChanged: (value) => _model.toggleDelivery(),
              ),
              MyText(
                'selfPickupfromLocalShop',
                style: labelMedium,
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _model.shouldSendGift,
                onChanged: (value) => _model.toggleDelivery(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: MyText(
                  'deliveredviaLocalGrocery',
                  maxLines: 2,
                  style: labelMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
