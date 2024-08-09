import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/repositories/user_repository.dart';
import 'package:local_grocery/support/config/app_shared_pref.dart';
import 'package:local_grocery/view_models/base_view_model.dart';
import 'dart:async';

enum EMainCurrentView {
  splash_view,
  dashboard_view,
  login_view,
  sign_up_view,
  forget_password_view,
  reset_password_view,
  otp_view,
  selection_view,
}

class UserViewModel extends BaseViewModel {
  /// Repository
  final _respository = UserRepository();

  /// Observables
  RxBool isLoginView = true.obs;
  RxBool showPassword = true.obs;
  RxBool showRenterPassword = true.obs;
  RxInt userId = 0.obs;
  RxInt currentView = EMainCurrentView.splash_view.index.obs;
  RxBool skipLoginView = false.obs;
  RxBool canResendOtp = false.obs;
  RxBool startTimer = true.obs;
  RxBool isDarkTheme = false.obs;

  /// user login input
  String? userEmailPhoneInput;
  String? userPasswordInput;
// user signup
  String? userFirstNameInput;
  String? userMiddleNameInput;
  String? userLastNameInput;
  String? userEmailInput;
  String? userCellNumberInput;
  String? userReEnterPasswordInput;
  String? userAddressInput;
  String? userReEnterAddressInput;
  RxBool checkboxValue = false.obs;
  RxBool isLicenseCheckboxValue = false.obs;
  RxBool souldReliableCheckboxValue = false.obs;
  RxBool hasSmartPhoneCheckboxValue = false.obs;

  UserViewModel() {
    userId.value = AppSharedPref.getUserId();
  }

  /// Constructor
  static UserViewModel load() {
    if (!Get.isRegistered<UserViewModel>()) {
      return Get.put(UserViewModel());
    } else {
      final viewModel = Get.find<UserViewModel>();
      return viewModel;
    }
  }

  /// Common methods
  Future<void> fetchData() async {
    setLoading();
    await Future.delayed(
      const Duration(seconds: 5),
    );

    setComplete();
  }

  void ShowPassword() {
    showPassword.toggle();
  }

  void showRePassword() {
    showRenterPassword.toggle();
  }

  void toggleResend() {
    canResendOtp.value = !canResendOtp.value;
    startTimer.value = !startTimer.value;
  }

  /// set logged out state
  void logout() {
    AppSharedPref.setUserId(0);
    currentView.value = EMainCurrentView.selection_view.index;
    userId.value = 0;
  }

  void login(int _userId) {
    userId.value = _userId;
    AppSharedPref.setUserId(_userId);
    currentView.value = EMainCurrentView.dashboard_view.index;
  }

  void toggleSplashDashboard() {
    currentView.value = EMainCurrentView.dashboard_view.index;
  }

  void toggleLoginForgetView(bool _isLoginView) {
    if (_isLoginView) {
      currentView.value = EMainCurrentView.login_view.index;
    } else {
      currentView.value = EMainCurrentView.forget_password_view.index;
    }
  }

  void toggleForgetResetView(bool _isForgetPasswordView) {
    if (_isForgetPasswordView) {
      currentView.value = EMainCurrentView.forget_password_view.index;
    } else {
      currentView.value = EMainCurrentView.reset_password_view.index;
    }
  }

  void toggleLoginSignView(bool _isLoginView) {
    if (_isLoginView) {
      currentView.value = EMainCurrentView.login_view.index;
    } else {
      currentView.value = EMainCurrentView.sign_up_view.index;
    }
  }

  void toggleSignupOTPView(bool _isLoginView) {
    if (_isLoginView) {
      currentView.value = EMainCurrentView.sign_up_view.index;
    } else {
      currentView.value = EMainCurrentView.otp_view.index;
    }
  }

  void toggleTheme() {
    isDarkTheme.toggle();
    notify();
  }

  bool canLogin() =>
      (userEmailPhoneInput?.isNotEmpty ?? false) &&
      (userPasswordInput?.isNotEmpty ?? false);
  bool canCreateAccount() =>
      (userFirstNameInput?.isNotEmpty ?? false) &&
      (userLastNameInput?.isNotEmpty ?? false) &&
      (userMiddleNameInput?.isNotEmpty ?? false) &&
      (userEmailInput?.isNotEmpty ?? false) &&
      (userCellNumberInput?.isNotEmpty ?? false) &&
      (userPasswordInput?.isNotEmpty ?? false) &&
      (userReEnterPasswordInput?.isNotEmpty ?? false);
  bool canDriverAccount() =>
      (userFirstNameInput?.isNotEmpty ?? false) &&
      (userLastNameInput?.isNotEmpty ?? false) &&
      (userMiddleNameInput?.isNotEmpty ?? false) &&
      (userEmailInput?.isNotEmpty ?? false) &&
      (userCellNumberInput?.isNotEmpty ?? false) &&
      (userPasswordInput?.isNotEmpty ?? false) &&
      (userReEnterPasswordInput?.isNotEmpty ?? false);
  void updateUserEmailPhoneInput(String value) {
    userEmailPhoneInput = value;
    notify();
  }

  void updateUserPasswordInput(String value) {
    userPasswordInput = value;
    notify();
  }

  void updateUserFirstNameInput(String value) {
    userFirstNameInput = value;
    notify();
  }

  void updateUserMiddleNameInput(String value) {
    userMiddleNameInput = value;
    notify();
  }

  void updateUserLastNameInput(String value) {
    userLastNameInput = value;
    notify();
  }

  void updateUserEmailInput(String value) {
    userEmailInput = value;
    notify();
  }

  void updateUserCellNumberInput(String value) {
    userCellNumberInput = value;
    notify();
  }

  void updateUserReEnterPasswordInput(String value) {
    userReEnterPasswordInput = value;
    notify();
  }

  bool get isAlreadyLogin => userId.value != 0;

  void updateLanguage(String languageCode) {
    Get.updateLocale(Locale(languageCode));
  }
}
