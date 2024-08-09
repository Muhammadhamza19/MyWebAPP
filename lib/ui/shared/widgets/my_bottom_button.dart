import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/components/dialog_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class MyBottomButton extends StatelessWidget {
  final String buttonText;
  // final IconData? iconData;
  final String? text1;
  final String? text2;

  final IconPosition iconPosition;
  final double? iconSize;
  final Color? textColor;
  final VoidCallback? onPressed;
  final Color? color;
  final bool fullWidth;
  final double minHeight;

  const MyBottomButton({
    Key? key,
    required this.buttonText,
    this.text1,
    this.text2,
    this.iconPosition = IconPosition.start,
    this.iconSize,
    this.textColor,
    this.onPressed,
    this.color,
    this.fullWidth = false,
    this.minHeight = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translatedText = MyText(
      buttonText,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(color: textColor ?? backgroundColor),
    );

    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Adjust button size for tablets using below
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(),
          side: BorderSide(
            color: textColor ?? primaryColor,
            width: 1,
          ),
          backgroundColor: color,
          disabledBackgroundColor: Colors.grey,
          // Background Color
          disabledForegroundColor: Colors.grey[50], //buttonText Color
        ),
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: text1 != null || text2 != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
                children: <Widget>[
                  if (text1 != null || text2 != null) ...[
                    MyText(
                      text1 ?? "",
                      style: TextStyle(
                        color: backgroundColor,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Flexible(child: translatedText),
                    const SizedBox(width: 8.0),
                    MyText(
                      text2 ?? "",
                      style: TextStyle(
                        color: backgroundColor,
                      ),
                    ),
                  ] else ...[
                    Flexible(child: translatedText),
                    const SizedBox(width: 8.0),
                    MyText(
                      text1 ?? "",
                      style: TextStyle(
                        color: backgroundColor,
                      ),
                    ),
                  ],
                ],
              )
            : fullWidth
                ? SizedBox(
                    width: double.infinity,
                    child: Center(child: translatedText),
                  )
                : translatedText,
      ),
    );
  }
}
