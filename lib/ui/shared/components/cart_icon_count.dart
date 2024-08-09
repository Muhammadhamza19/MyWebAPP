import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class CartIconCount extends StatelessWidget {
  final int cartItemCount;
  void Function()? onPressed;

  CartIconCount({required this.cartItemCount, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: onPressed),
        if (cartItemCount > 0)
          Positioned(
            right: 0,
            child: Container(
              // padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: MyText(
                '$cartItemCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
