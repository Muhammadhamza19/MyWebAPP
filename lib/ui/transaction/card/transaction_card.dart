import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class TransactionCard extends StatelessWidget {
  final Transaction? transaction;
  Function()? onTap;
  TransactionCard({this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          MyText("Transaction Id"),
                          MyText(
                            "${transaction?.transactionId}",
                            style: titleSmall,
                          ),
                        ],
                      ),
                    ),
                    // MyText(
                    //   "${transaction.currency} ${transaction.price}",
                    //   style: primarySmall,
                    // )
                  ],
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
                        MyText("${transaction?.status}"),
                      ],
                    ),
                    wGap12,
                    Column(
                      children: [
                        MyText(
                          "deliveryMethod",
                          style: labelLarge,
                        ),
                        MyText("${transaction?.deliveryMethod}"),
                      ],
                    ),
                    wGap12,
                    Column(
                      children: [
                        MyText(
                          "date",
                          style: labelLarge,
                        ),
                        MyText("${transaction?.TransactionDate}"),
                      ],
                    ),
                  ],
                ),
                ProgressionButtonView(
                  progressionButtons: [
                    ProgressionButton(
                      text: "View ",
                      color: primaryColor,
                      onPressed: onTap,
                      icon: FontAwesomeIcons.eye,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
