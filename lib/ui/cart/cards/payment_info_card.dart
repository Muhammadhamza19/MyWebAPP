import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class PaymentInfoCard extends StatelessWidget {
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
                "paymentMethod",
                style: titleSmall,
              ),
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.creditCard),
                wGap12,
                MyText("1235 6549 8745 7523")
              ],
            )
          ],
        ),
      ),
    );
  }
}
