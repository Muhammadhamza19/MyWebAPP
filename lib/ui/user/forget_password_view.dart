import 'package:get/get.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/heading_component.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  /// load view model
  final UserViewModel _model = UserViewModel.load();
  TextEditingController? _emailcontroller = TextEditingController();
  TextEditingController? _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      appBar: MyAppBar(
        onBackPressed: () => _model.toggleLoginForgetView(true),
      ),
      body: _pageContent(context),
    );
  }

  Widget _pageContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            _headings(context),
            hGap32,
            hGap32,
            hGap32,

            /// Form
            _form(),

            /// Forget password
            hGap32,
            hGap32,

            /// Login button and text
            _loginButtonAndText(context),
          ]),
          CopyRightComponent()
        ],
      ),
    );
  }

  /// this method will contain view for headings
  Widget _headings(BuildContext context) {
    return Column(
      children: [
        HeadingComponent(
          text1: 'welcomeTo'.tr,
          text2: 'localGrocery'.tr,
        ),
        hGap8,
        MyText(
          'loginTagLine'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }

  /// this method will contain view for login button and text
  Widget _loginButtonAndText(BuildContext context) {
    return Column(
      children: [
        MyButton(
          text: 'continueButton'.tr,
          fullWidth: true,
          color: primaryColor,
          onPressed: () {
            _model.toggleForgetResetView(false);
          },
        ),
        hGap20,
      ],
    );
  }

  Widget _form() {
    return Column(
      children: [
        MyInputBox(
          borderLabel: 'emailPhoneNumber'.tr,
          borderColor: borderColor,
          icon: Icons.person,
          iconColor: borderColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _emailcontroller,
          onTap: () async {},
        ),

        hGap12,
        // MyInputBox(),
      ],
    );
  }
}
