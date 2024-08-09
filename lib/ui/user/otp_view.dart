import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/authentication_code_input.dart';
import 'package:local_grocery/ui/shared/components/copy_right_component.dart';
import 'package:local_grocery/ui/shared/components/count_down_timer.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class OtpView extends StatelessWidget {
  final UserViewModel _model = UserViewModel.load();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      appBar: MyAppBar(
        onBackPressed: () => _model.toggleSignupOTPView(
          true,
        ),
      ),
      body: _pageContent(context),
    );
  }

  Widget _pageContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hGap32,
          Column(
            children: [
              MyText(
                'verificationCode'.tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              hGap32,

              /// Form
              Obx(
                () => _otpform(context),
              ),

              /// Forget password
              hGap32,
              hGap32,
              hGap32,
              Align(
                alignment: Alignment.center,
                child: MyText(
                  'verifcationCodeInstruction'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              hGap32,
              hGap32,

              /// Login button and text
            ],
          ),
          hGap32,
          CopyRightComponent()
        ],
      ),
    );
  }

  Widget _otpform(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthenticationCodeInput(
            onOtpEntered: (String value) {
              _model.login(1);
            },
          ),
          hGap20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                'didntReciveCode'.tr,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 13,
                ),
              ),
              GestureDetector(
                onTap: _model.canResendOtp.value
                    ? () => _model.toggleResend()
                    : null,
                child: MyText(
                  'resend'.tr,
                  style: TextStyle(
                    color:
                        _model.canResendOtp.value ? primaryColor : borderColor,
                    fontSize: 13,
                  ),
                ),
              ),
              wGap8,
              if (_model.startTimer.value) ...[
                CountDownTimer(
                  endTime: DateTime.now().add(
                    Duration(seconds: 10),
                  ),
                  onFinish: () => _model.toggleResend(),
                  applythemeColor: TextStyle(
                    color: primaryColor,
                    fontSize: 13,
                  ),
                )
              ]
            ],
          ),
        ],
      ),
    );
  }
}
