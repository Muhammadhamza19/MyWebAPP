import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class OnlineExclusiveCard extends StatelessWidget {
  const OnlineExclusiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12,
          top: 8,
          bottom: 8,
        ),
        child: MyText(
          "ONLINE EXCLUSIVE",
          style: TextStyle(
            color: backgroundColor,
            fontSize: 13,
          ),
        ),
      ),
    );
    ;
  }
}
