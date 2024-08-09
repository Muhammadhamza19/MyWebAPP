import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';

import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';

class LoginSignupSelectionView extends StatelessWidget {
  final UserViewModel _model = UserViewModel.load();
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      appBar: MyAppBar(
        child: Align(
          child: IconButton(
              onPressed: () => Get.back(), icon: Icon(FontAwesomeIcons.cross)),
        ),
      ),
      automaticallyImplyLeading: false,
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
              hGap32,
              hGap32,
              _loginAndCreateAccountButton(context),
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

  Widget _loginAndCreateAccountButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          MyButton(
            text: 'login'.tr,
            fullWidth: true,
            color: primaryColor,
            onPressed: () {
              _model.skipLoginView.value = false;
              _model.toggleLoginSignView(true);
            },
          ),
          hGap8,
          MyButton(
            text: 'createAccount'.tr,
            fullWidth: true,
            color: backgroundColor,
            textColor: primaryColor,
            onPressed: () {
              _model.skipLoginView.value = true;
              _model.toggleLoginSignView(false);
            },
          ),
        ],
      ),
    );
  }
}
