import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/ui/shared/components/heading_component.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupView extends StatelessWidget {
  /// load view model
  final UserViewModel _model = UserViewModel.load();
  TextEditingController? _firstNameController = TextEditingController();
  TextEditingController? _lastNameController = TextEditingController();
  TextEditingController? _middleNameController = TextEditingController();
  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _cellNumberController = TextEditingController();
  TextEditingController? _passwordController = TextEditingController();
  TextEditingController? _reEnterPasswordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      automaticallyImplyLeading: false,
      appBar: MyAppBar(
        onBackPressed: () => _model.skipLoginView.value
            ? _model.logout()
            : _model.toggleLoginSignView(true),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus =
              FocusScope.of(_scaffoldKey.currentContext!);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Obx(
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            _headings(context),
            hGap12,

            /// Form
            Obx(() => _form(context)),
            // hGap12,
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Obx(() => Checkbox(
                        // visualDensity: VisualDensity.compact,
                        value: _model.checkboxValue.value,
                        activeColor: primaryColor,
                        hoverColor: primaryColor,
                        onChanged: (value) {
                          _model.checkboxValue(value!);
                        },
                      )),
                  MyText(
                    'termsAndCondition'.tr,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            hGap32,
            // hGap32,

            /// Login button and text
            _loginButtonAndText(context),
          ]),
          hGap12,
          CopyRightComponent()
        ],
      ),
    );
  }

  /// this method will contain view for headings
  Widget _headings(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 10,
      ),
      child: Column(
        children: [
          HeadingComponent(
            text1: 'welcomeTo'.tr,
            text2: 'localGrocery'.tr,
          ),
          hGap8,
          MyText(
            'signupTagLine'.tr,
            textAlign: TextAlign.center,
            style: labelMedium,
          ),
        ],
      ),
    );
  }

  /// this method will contain view for login button and text
  Widget _loginButtonAndText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 10,
      ),
      child: Column(
        children: [
          MyButton(
            text: 'createAccount'.tr,
            fullWidth: true,
            color: primaryColor,
            onPressed: _model.canCreateAccount()
                ? () {
                    _model.toggleSignupOTPView(false);
                  }
                : null,
          ),
          hGap20,
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  'aleardyAccount'.tr,
                  textAlign: TextAlign.right,
                  style: labelLarge,
                ),
                GestureDetector(
                  onTap: () {
                    _model.skipLoginView.value = true;
                    _model.toggleLoginSignView(true);
                  },
                  child: MyText(
                    'login'.tr,
                    textAlign: TextAlign.right,
                    style: labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 10,
      ),
      child: Column(
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
            onChanged: (String value) =>
                _model.updateUserMiddleNameInput(value),
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
          // MyInputBox(
          //   borderLabel: 'cellNumber,
          //   borderColor: borderColor,
          //   iconColor: borderColor,
          //   floatingLabelBehavior: FloatingLabelBehavior.always,
          //   controller: _cellNumberController,
          //   onChanged: (String value) => userCellNumberInput = value,
          // ),
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
          // MyInputBox(),
          MyInputBox(
            borderLabel: 'password'.tr,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: _passwordController,
            suffixIcon: Icons.remove_red_eye,
            obscureText: _model.showPassword.value,
            translate: () {
              _model.ShowPassword();
            },
            suffixColor: _model.showPassword.value ? borderColor : primaryColor,
            onChanged: (String value) => _model.updateUserPasswordInput(value),
          ),
          hGap12,

          MyInputBox(
            borderLabel: 'reEnterPassword'.tr,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: _reEnterPasswordController,
            suffixIcon: Icons.remove_red_eye,
            obscureText: _model.showRenterPassword.value,
            translate: () {
              _model.showRePassword();
            },
            suffixColor:
                _model.showRenterPassword.value ? borderColor : primaryColor,
            onChanged: (String value) =>
                _model.updateUserReEnterPasswordInput(value),
          ),
          hGap12,
        ],
      ),
    );
  }
}
