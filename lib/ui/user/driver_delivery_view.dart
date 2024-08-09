import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DriverDeliveryView extends StatelessWidget {
  /// load view model
  final UserViewModel _model = UserViewModel.load();
  TextEditingController? _firstNameController = TextEditingController();
  TextEditingController? _lastNameController = TextEditingController();
  TextEditingController? _middleNameController = TextEditingController();
  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _cellNumberController = TextEditingController();
  TextEditingController? _addressController = TextEditingController();
  TextEditingController? _reEnterAddressController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      automaticallyImplyLeading: false,
      appBar: MyAppBar(
        title: "Driver Delivery",
        onBackPressed: () => Get.back(),
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
    _addressController!.text = _model.userAddressInput ?? "";
    _reEnterAddressController!.text = _model.userReEnterAddressInput ?? "";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            hGap12,

            /// Form
            Obx(() => _form(context)),
            // hGap12,

            hGap32,
            // hGap32,
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Wrap(
                children: [
                  Obx(() => Checkbox(
                        // visualDensity: VisualDensity.compact,
                        value: _model.isLicenseCheckboxValue.value,
                        activeColor: primaryColor,
                        hoverColor: primaryColor,
                        onChanged: (value) {
                          _model.isLicenseCheckboxValue(value!);
                        },
                      )),
                  MyText(
                    'Do you have a valid driving license with clean driving history',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Obx(() => Checkbox(
                        // visualDensity: VisualDensity.compact,
                        value: _model.souldReliableCheckboxValue.value,
                        activeColor: primaryColor,
                        hoverColor: primaryColor,
                        onChanged: (value) {
                          _model.souldReliableCheckboxValue(value!);
                        },
                      )),
                  MyText(
                    'Do you hae a reliable Vehicle with insuarance',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Obx(() => Checkbox(
                        // visualDensity: VisualDensity.compact,
                        value: _model.hasSmartPhoneCheckboxValue.value,
                        activeColor: primaryColor,
                        hoverColor: primaryColor,
                        onChanged: (value) {
                          _model.hasSmartPhoneCheckboxValue(value!);
                        },
                      )),
                  MyText(
                    'Do you have access to smart phone',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Monday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Tuesday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Wednesday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Thursday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Friday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Saturday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            // visualDensity: VisualDensity.compact,
                            value: _model.souldReliableCheckboxValue.value,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                            onChanged: (value) {
                              _model.souldReliableCheckboxValue(value!);
                            },
                          )),
                      MyText(
                        'Sunday',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Login button and text
            _addSectionButton(context),
          ]),
          hGap12,
          CopyRightComponent()
        ],
      ),
    );
  }

  /// this method will contain view for login button and text
  Widget _addSectionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 10,
      ),
      child: Column(
        children: [
          MyButton(
            text: 'Save',
            fullWidth: true,
            color: primaryColor,
            onPressed: _model.canDriverAccount() ? () {} : null,
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
                  color: isDark ? primaryColor : borderColor,
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
            borderLabel: 'Address 1',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: _addressController,
          ),
          hGap12,

          MyInputBox(
            borderLabel: 'Address 2',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: _reEnterAddressController,
          ),
          hGap12,
          MyInputBox(
            borderLabel: 'City',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: _addressController,
          ),
          hGap12,

          MyInputBox(
            borderLabel: 'Country',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: _reEnterAddressController,
          ),
          hGap12,
        ],
      ),
    );
  }
}
