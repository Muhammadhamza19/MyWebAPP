import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class PaymentDetailCard extends StatelessWidget {
  final CardDetail? cardDetail;
  PaymentDetailCard({this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  "cardInfo",
                  style: titleSmall,
                ),
                Icon(Icons.edit_square)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(FontAwesomeIcons.moneyBill),
                wGap12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      cardDetail?.cardHolderName ?? "",
                      style: labelLarge,
                    ),
                    MyText(
                      cardDetail?.cardNumber ?? "",
                    ),
                    MyText(
                      cardDetail?.cardExpiry ?? "",
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
