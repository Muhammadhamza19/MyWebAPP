import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:local_grocery/ui/shared/components/dialog_button.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';

class ProgressionButtonView extends StatelessWidget {
  final List<ProgressionButton> progressionButtons;
  final bool showBorder;
  final bool loading;
  final WrapAlignment? wrapAlignment;
  final bool removeDecoration;

  const ProgressionButtonView({
    Key? key,
    required this.progressionButtons,
    this.showBorder = true,
    this.loading = false,
    this.wrapAlignment,
    this.removeDecoration = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (progressionButtons.isEmpty) return SizedBox();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: removeDecoration
          ? null
          : BoxDecoration(
              color: isDark ? secondaryColor : Colors.white,
              border: showBorder
                  ? Border(
                      top: BorderSide(
                        color: isDark ? primaryColor : Colors.grey[300]!,
                      ),
                    )
                  : null),
      child: Wrap(
        runSpacing: 8,
        alignment: wrapAlignment ?? WrapAlignment.center,
        children: loading ? _loadingView() : _buttonRow(),
      ),
    );
  }

  List<Widget> _buttonRow() {
    return progressionButtons
        .map(
          (button) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: MyButton(
              //fullWidth: true,
              text: button.text.tr,
              iconData: button.icon,
              iconSize: button.iconSize,
              iconPosition: button.iconPosition,
              color: button.color,
              onPressed: button.onPressed,
            ),
          ),
        )
        .toList();
  }

  List<Widget> _loadingView() {
    return progressionButtons
        .map(
          (button) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
            child: ShimmerWidget(
              child: Box(explicitHeight: 36.0, width: BoxSize.quarter),
            ),
          ),
        )
        .toList();
  }
}

class ProgressionButton {
  final String text;
  final IconData? icon;
  final double? iconSize;
  final Color? color;
  final VoidCallback? onPressed;
  final IconPosition iconPosition;

  ProgressionButton({
    required this.text,
    this.icon,
    this.iconSize,
    this.color,
    this.onPressed,
    this.iconPosition = IconPosition.start,
  });

  ProgressionButton.iconEnd({
    required this.text,
    this.icon,
    this.iconSize,
    this.color,
    this.onPressed,
    this.iconPosition = IconPosition.end,
  });
}
