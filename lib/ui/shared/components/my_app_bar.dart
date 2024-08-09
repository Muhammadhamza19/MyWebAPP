import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class MyAppBar extends StatelessWidget {
  final String? title;
  final Function()? onBackPressed;
  final Widget? child;

  MyAppBar({
    this.title,
    this.onBackPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBackPressed != null)
          IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
              color: primaryColor,
            ),
            onPressed: onBackPressed,
          ),
        MyText(
          title ?? "",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        if (child != null) Expanded(child: child!),
      ],
    );
  }
}
