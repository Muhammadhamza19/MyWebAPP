import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:local_grocery/models/dashboard_response_main.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/payement_component.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';

import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/cart_view_model.dart';

class PaymentView extends StatelessWidget {
  final _model = Get.find<CartViewModel>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  PaymentView({super.key});
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      appBar: _appBar(),
      body: _pageContent(context, _model),
    );
  }

  Widget _appBar() {
    return MyAppBar(
      // title: "dashboard",
      title: "paymentMethod",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _pageContent(BuildContext context, CartViewModel _model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyText(
            "enterCardDetails",
            style: titleSmall,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: _form(_model, context),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DebitCardInput(
            cardNumberController: _cardNumberController,
            expiryDateController: _expiryDateController,
            cvvController: _cvvController,
            cardHolderNameController: _cardHolderNameController,
          ),
        ),
        ProgressionButtonView(
          progressionButtons: [
            ProgressionButton(
                text: "Save Card",
                color: primaryColor,
                icon: FontAwesomeIcons.floppyDisk,
                onPressed: () {
                  _model.addCardDetail(_model
                          .cardDetail?[(_model.cardDetail?.length ?? 0) + 1] ??
                      CardDetail());
                })
          ],
        ),
        Row(
          children: [
            Obx(() => Checkbox(
                  // visualDensity: VisualDensity.compact,
                  value: _model.checkboxValue.value,

                  onChanged: (value) {
                    _model.checkboxValue(value!);
                  },
                )),
            MyText(
              'saveCardForThisUser',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),

        // ListView.builder(
        //   itemCount: _model.cardDetail?.length,
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: PaymentDetailCard(
        //         cardDetail: _model.cardDetail?[index],
        //       ),
        //     );
        //   },
        // )
      ],
    );
  }
}
