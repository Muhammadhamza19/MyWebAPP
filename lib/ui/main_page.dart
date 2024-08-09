import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/dashboard/dashboard_main_page.dart';
import 'package:local_grocery/ui/splash/splash_view.dart';
import 'package:local_grocery/ui/user/forget_password_view.dart';
import 'package:local_grocery/ui/user/login_signup_selection_view.dart';
import 'package:local_grocery/ui/user/login_view.dart';
import 'package:local_grocery/ui/user/otp_view.dart';
import 'package:local_grocery/ui/user/reset_password_view.dart';
import 'package:local_grocery/ui/user/signup_view.dart';
import 'package:local_grocery/view_models/user_view_model.dart';

class MainPage extends StatelessWidget {
  final UserViewModel _model = UserViewModel.load();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _pageContent(context),
    );
  }

  Widget _pageContent(BuildContext context) {
    switch (_model.currentView.value) {
      case 0:
        return SplashView();
      case 1:
        return DashboardMainPage();
      case 2:
        return LoginView();
      case 3:
        return SignupView();
      case 4:
        return ForgetPasswordView();
      case 5:
        return ResetPasswordView();
      case 6:
        return OtpView();
      default:
        return LoginSignupSelectionView();
    }
  }
}
