import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/components/dialog_button.dart';

/// Generic action buttons for our dialogs
/// Will show one or two depending on whether negative has text
/// Positive text is required!
/// Will return a true value for positive click and false for negative
class DialogActionButton extends StatelessWidget {
  final String? positiveButtonText;
  final IconData? positiveButtonIcon;
  final Color? positiveButtonColor;
  final String? negativeButtonText;
  final IconData? negativeButtonIcon;
  final Color? negativeButtonColor;
  final Function? positiveFunction;
  final Function? negativeFunction;
  final bool showNegativeButtonBackgroundColor;
  final bool disableNegativeFunction;
  final bool? disablePositiveFunction;

  const DialogActionButton({
    required this.positiveButtonText,
    this.positiveButtonIcon,
    this.positiveButtonColor,
    this.negativeButtonText,
    this.negativeButtonIcon,
    this.negativeButtonColor,
    this.positiveFunction,
    this.negativeFunction,
    this.showNegativeButtonBackgroundColor = true,
    this.disableNegativeFunction = false,
    this.disablePositiveFunction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: borderColor))),
      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /// Negative Button
          negativeButtonText != null
              ? Expanded(
                  child: DialogButton(
                    iconPosition: IconPosition.left,
                    icon: negativeButtonIcon,
                    text: negativeButtonText,
                    color: showNegativeButtonBackgroundColor
                        ? negativeButtonColor
                        : primaryColor,
                    textColor: backgroundColor,
                    hasElevation: showNegativeButtonBackgroundColor,
                    onTap: disableNegativeFunction
                        ? null
                        : negativeFunction ??
                            () => Navigator.of(context).pop(false),
                  ),
                )
              : Container(),
          negativeButtonText != null && positiveButtonText != null
              ? const SizedBox(width: 6.0)
              : SizedBox(),

          /// Positive Button
          positiveButtonText != null
              ? Expanded(
                  child: DialogButton(
                    iconPosition: IconPosition.right,
                    icon: positiveButtonIcon,
                    text: positiveButtonText,
                    color: positiveButtonColor,
                    textColor: backgroundColor,
                    onTap: disablePositiveFunction ?? false
                        ? null
                        : () => positiveFunction != null
                            ? positiveFunction!()
                            : Navigator.of(context).pop(true),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
