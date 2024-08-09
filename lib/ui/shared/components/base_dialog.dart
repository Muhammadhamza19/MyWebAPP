import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/shared/components/dialog_action_button.dart';
import 'package:local_grocery/ui/shared/components/dialog_app_bar.dart';

class BaseDialog extends StatelessWidget {
  final String? subTitle;
  final String? title;
  final Widget child;
  final DialogActionButton? dialogActions;
  final ShapeBorder? shape;
  final EdgeInsets? insetPadding;

  const BaseDialog({
    Key? key,
    required this.child,
    this.title,
    this.subTitle,
    this.dialogActions,
    this.shape,
    this.insetPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Dialog(
        shape: shape,
        insetPadding: insetPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              DialogAppBar(
                title: title ?? "",
                subTitle: subTitle,
              ),
            ],
            Flexible(child: child),
            if (dialogActions != null) ...[
              dialogActions!,
            ],
            if (dialogActions == null)
              DialogActionButton(
                positiveButtonText: null,
                negativeButtonText: 'close'.tr,
                negativeButtonIcon: Icons.cancel,
                negativeFunction: () => Navigator.of(context).pop(),
              )
          ],
        ),
      ),
    );
  }
}
