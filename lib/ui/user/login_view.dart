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

class LoginView extends StatelessWidget {
  /// load view model
  final UserViewModel _model = UserViewModel.load();
  TextEditingController? _emailcontroller = TextEditingController();
  TextEditingController? _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BaseScaffoldScreen(
        automaticallyImplyLeading: false,
        appBar: MyAppBar(
          onBackPressed: () => _model.skipLoginView.value
              ? _model.toggleLoginSignView(false)
              : _model.logout(),
        ),
        body: Obx(
          () => _model.shouldNotify.value
              ? _pageContent(context)
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    _emailcontroller!.text = _model.userEmailPhoneInput ?? "";
    _passwordcontroller!.text = _model.userPasswordInput ?? "";

    return Padding(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _headings(context),
          Column(
            children: [
              /// Form
              Obx(
                () => _form(),
              ),

              /// Forget password
              hGap12,

              GestureDetector(
                onTap: () {
                  // _model.skipLoginView.value = false;
                  _model.toggleLoginForgetView(false);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MyText(
                    'forgetPassword'.tr,
                    textAlign: TextAlign.right,
                    style: labelLarge,
                  ),
                ),
              ),
              hGap32,
              hGap32,

              /// Login button and text
              _loginButtonAndText(context),
            ],
          ),
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
          style: labelMedium,
        ),
      ],
    );
  }

  /// this method will contain view for login button and text
  Widget _loginButtonAndText(BuildContext context) {
    return Column(
      children: [
        MyButton(
          text: 'login'.tr,
          fullWidth: true,
          color: primaryColor,
          onPressed: _model.canLogin() ? () => _model.login(1) : null,
        ),
        hGap20,
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                'newToLocalGrocery'.tr,
                textAlign: TextAlign.right,
                style: labelLarge,
              ),
              wGap4,
              GestureDetector(
                onTap: () {
                  _model.skipLoginView.value = false;
                  _model.toggleLoginSignView(false);
                },
                child: MyText(
                  'createAccount'.tr,
                  textAlign: TextAlign.right,
                  style: primaryMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _form() {
    return Column(
      children: [
        MyInputBox(
          borderLabel: 'emailPhoneNumber'.tr,
          icon: Icons.person,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _emailcontroller,
          onChanged: (String value) => _model.updateUserEmailPhoneInput(value),
        ),
        hGap12,
        MyInputBox(
          borderLabel: 'password'.tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _passwordcontroller,
          suffixIcon: Icons.remove_red_eye,
          obscureText: _model.showPassword.value,
          icon: Icons.lock,
          translate: () {
            _model.ShowPassword();
            // _model.updateLanguage("es");
            // _model.toggleTheme();
          },
          suffixColor: _model.showPassword.value ? borderColor : primaryColor,
          onChanged: (String value) => _model.updateUserPasswordInput(value),
        ),
      ],
    );
  }
}
