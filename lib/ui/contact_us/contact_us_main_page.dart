import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';

import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';

import 'package:flutter/material.dart';

class ContactUsMainPage extends StatelessWidget {
  /// load view model
  final UserViewModel _model = UserViewModel.load();
  TextEditingController? _firstNameController = TextEditingController();
  TextEditingController? _lastNameController = TextEditingController();
  TextEditingController? _middleNameController = TextEditingController();
  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _cellNumberController = TextEditingController();
  TextEditingController? _passwordController = TextEditingController();
  TextEditingController? _reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BaseScaffoldScreen(
        automaticallyImplyLeading: false,
        appBar: MyAppBar(
          title: "Contact Us",
          onBackPressed: () => Get.back(),
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
    _firstNameController!.text = _model.userFirstNameInput ?? "";
    _lastNameController!.text = _model.userLastNameInput ?? "";
    _middleNameController!.text = _model.userMiddleNameInput ?? "";
    _emailController!.text = _model.userEmailInput ?? "";
    _cellNumberController!.text = _model.userCellNumberInput ?? "";
    _passwordController!.text = _model.userPasswordInput ?? "";
    _reEnterPasswordController!.text = _model.userReEnterPasswordInput ?? "";

    return Padding(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                hGap12,

                /// Form
                Obx(
                  () => _form(),
                ),

                /// Forget password
                hGap12,

                /// Login button and text
                _loginButtonAndText(context),
              ],
            ),
            CopyRightComponent()
          ],
        ),
      ),
    );
  }

  /// this method will contain view for headings
  // Widget _headings(BuildContext context) {
  //   return Column(
  //     children: [
  //       HeadingComponent(
  //         text1: 'Feel Free To',
  //         text2: 'Contact',
  //       ),
  //     ],
  //   );
  // }

  /// this method will contain view for login button and text
  Widget _loginButtonAndText(BuildContext context) {
    return Column(
      children: [
        MyButton(
          text: 'Submit'.tr,
          fullWidth: true,
          color: primaryColor,
          onPressed: _model.canLogin() ? () => _model.login(1) : null,
        ),
        hGap20,
      ],
    );
  }

  Widget _form() {
    return Column(
      children: [
        MyInputBox(
          borderLabel: 'firstName'.tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _firstNameController,
          onChanged: (String value) => _model.updateUserFirstNameInput(value),
        ),
        hGap12,
        MyInputBox(
          borderLabel: 'middleName'.tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _middleNameController,
          onChanged: (String value) => _model.updateUserMiddleNameInput(value),
        ),
        hGap12,
        MyInputBox(
          borderLabel: 'lastName'.tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _lastNameController,
          onChanged: (String value) => _model.updateUserLastNameInput(value),
        ),
        hGap12,
        MyInputBox(
          borderLabel: 'email'.tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _emailController,
          onChanged: (String value) => _model.updateUserEmailInput(value),
        ),
        hGap12,
        IntlPhoneField(
          style: labelMedium,
          controller: _cellNumberController,
          keyboardType: TextInputType.phone,

          decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 12),
            labelText: 'Phone Number',
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: isDark ? backgroundColor : primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isDark ? primaryColor : borderColor!,
              ),
            ),
          ),
          languageCode: "en",
          initialCountryCode: 'PK',
          // onChanged: (value) =>
          // _model.updateUserCellNumberInput(value.toString()),
        ),
        hGap12,
        MyInputBox(
          borderLabel: 'Your Message',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          controller: _firstNameController,
          onChanged: (String value) => _model.updateUserFirstNameInput(value),
        ),
        hGap12,
      ],
    );
  }
}
