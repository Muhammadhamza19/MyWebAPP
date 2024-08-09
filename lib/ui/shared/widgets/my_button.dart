import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/components/dialog_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final IconPosition iconPosition;
  final double? iconSize;
  final Color? textColor;
  final VoidCallback? onPressed;
  final Color? color;
  final bool fullWidth;
  final double minHeight;

  const MyButton({
    Key? key,
    required this.text,
    this.iconData,
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
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(color: textColor ?? backgroundColor),
    );
    final icon = Icon(
      iconData,
      size: iconSize ?? 16,
      color: textColor ?? backgroundColor,
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
            color: textColor ?? borderColor,
            width: 1,
          ),
          backgroundColor: color,
          disabledBackgroundColor: Colors.grey,
          // Background Color
          disabledForegroundColor: Colors.grey[50], //Text Color
        ),
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: iconData != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
                children: <Widget>[
                  if (iconPosition == IconPosition.start) ...[
                    icon,
                    const SizedBox(width: 8.0),
                    Flexible(child: translatedText),
                  ] else ...[
                    Flexible(child: translatedText),
                    const SizedBox(width: 8.0),
                    icon,
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
