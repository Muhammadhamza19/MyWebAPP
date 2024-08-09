import 'package:flutter/material.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class DashboardCategoryCard extends StatelessWidget {
  final Category? category;

  DashboardCategoryCard({this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 10.0,
            top: 5,
            left: 5.0,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            color: isDark ? secondaryColor : backgroundColor,
            child: SizedBox(
              width: 60,
              height: 60,
              child: Center(
                child: Image.asset(
                  category!.image ?? "assets/images/vegetable.png",
                  height: 25, // Adjust the height and width as necessary
                  width: 25,
                ),
              ),
            ),
          ),
        ),
        hGap4,
        MyText(category?.categoryName ?? ""),
      ],
    );
  }
}
