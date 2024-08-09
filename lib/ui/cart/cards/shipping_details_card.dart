import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class ShippingDetailsCard extends StatelessWidget {
  ShippingDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? secondaryColor : backgroundColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(
                "shippingDetails",
                style: titleSmall,
              ),
            ),
            _buildDetailSection("name", "Muhammad Saad Iqbal"),
            _buildDetailSection("contactDetails", "+92 331 384 4515"),
            _buildDetailSection(
              "address",
              "A-123, Block 4, DHA, Phase 2, Karachi,Pakistan.",
              isAddress: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String detail,
      {bool isAddress = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title,
            style: labelLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isAddress
                  ? SizedBox(
                      width: 250,
                      child: MyText(detail),
                    )
                  : MyText(detail),
              Icon(Icons.arrow_forward_ios_sharp),
            ],
          ),
        ],
      ),
    );
  }
}
