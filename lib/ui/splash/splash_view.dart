import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/location_view_model.dart';
import 'package:local_grocery/view_models/user_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final UserViewModel _model = Get.find<UserViewModel>();

  ChangeScreeen() async {
    Future.delayed(Duration(seconds: 3), () {
      _model.toggleSplashDashboard();
    });
  }

  void initState() {
    Get.put(UserViewModel());
    Get.put(LocationViewModel());
    ChangeScreeen();

    super.initState();
  }

  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      body: _pageContent(context),
    );
  }

  Widget _pageContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hGap4,
        Align(
          alignment: Alignment.topRight,
          child: MyAssetImage(
            imageName: 'landing_page_image',
            height: 220,
            width: 325,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _headings(context),
            ],
          ),
        ),
        CopyRightComponent()
      ],
    );
  }

  Widget _headings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          'welcomeTo'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        MyText(
          'localGrocery'.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        hGap8,
        MyText(
          'appTagLine'.tr,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
