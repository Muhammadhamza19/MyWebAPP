import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/location_view_model.dart';

class LocationTextField extends StatelessWidget {
  final LocationViewModel locationController = Get.find<LocationViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return MyText(
            "${locationController.street},${locationController.locality} ",
            style: labelLarge,
          );
        }),
      ],
    );
  }
}
