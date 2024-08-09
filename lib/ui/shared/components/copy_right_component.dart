import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class CopyRightComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: MyText(
          'copyRights'.tr,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
