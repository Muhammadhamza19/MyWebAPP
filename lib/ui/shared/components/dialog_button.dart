import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

enum IconPosition { left, right, start, end }

class DialogButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? color;
  final Color? textColor;
  final bool hasElevation;
  final Function? onTap;
  final bool roundBottomRight;
  final bool roundBottomLeft;
  final IconPosition iconPosition;

  const DialogButton(
      {this.icon,
      this.text,
      this.onTap,
      this.color,
      this.hasElevation = true,
      this.roundBottomLeft = false,
      this.roundBottomRight = false,
      this.textColor,
      this.iconPosition = IconPosition.left,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: color,
      disabledBackgroundColor: Colors.grey[500],
      disabledForegroundColor: Colors.grey[50],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: roundBottomRight
                  ? const Radius.circular(6.0)
                  : const Radius.circular(0.0),
              bottomLeft: roundBottomLeft
                  ? const Radius.circular(6.0)
                  : const Radius.circular(0.0))),
      elevation: hasElevation ? null : 0.0,
    );
    final child = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (iconPosition == IconPosition.right) ...[
                Flexible(
                  child: MyText(
                    text ?? "",
                    style: TextStyle(color: textColor),
                  ),
                ),
                wGap8,
                Icon(
                  icon,
                  size: 20.0,
                  color: backgroundColor,
                ),
              ] else ...[
                Icon(
                  icon,
                  size: 20.0,
                  color: backgroundColor,
                ),
                wGap8,
                Flexible(
                  child: MyText(
                    text ?? "",
                    style: TextStyle(color: textColor),
                  ),
                ),
              ]
            ],
          )
        : MyText(
            text ?? "",
            style: TextStyle(
              color: textColor,
            ),
          );

    return ElevatedButton(
        key: Key(text!),
        style: style,
        child: child,
        onPressed: onTap as void Function()?);
  }
}
