import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';

class DebitCardInput extends StatefulWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final TextEditingController cardHolderNameController;

  DebitCardInput({
    Key? key,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
    required this.cardHolderNameController,
  }) : super(key: key);

  @override
  _DebitCardInputState createState() => _DebitCardInputState();
}

class _DebitCardInputState extends State<DebitCardInput> {
  String? cardType;

  bool _isValidCardNumber(String input) {
    // Remove spaces from input
    final cardNumber = input.replaceAll(' ', '');

    // Check if card number starts with Visa or MasterCard patterns
    final visaPattern = RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$');
    final masterCardPattern = RegExp(
        r'^(?:5[1-5][0-9]{14}|2(?:2[2-9][0-9]{12}|[3-6][0-9]{13}|7[01][0-9]{12}|720[0-9]{12}))$');

    if (visaPattern.hasMatch(cardNumber)) {
      cardType = 'visa';
      return true;
    } else if (masterCardPattern.hasMatch(cardNumber)) {
      cardType = 'mastercard';
      return true;
    } else {
      cardType = null;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyInputBox(
          controller: widget.cardNumberController,
          borderLabel: 'Card Number',
          icon: cardType == null
              ? null
              : cardType == 'visa'
                  ? FontAwesomeIcons.ccVisa
                  : FontAwesomeIcons.ccMastercard,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            _CardNumberInputFormatter(),
          ],
          onChanged: (value) {
            setState(() {
              _isValidCardNumber(value);
            });
          },
        ),
        hGap16,
        MyInputBox(
          controller: widget.expiryDateController,
          borderLabel: 'Expiry Date (MM/YY)',
          keyboardType: TextInputType.datetime,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
            _ExpiryDateInputFormatter(),
          ],
        ),
        hGap16,
        MyInputBox(
          controller: widget.cvvController,
          borderLabel: 'CVV',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
        ),
        hGap16,
        MyInputBox(
          controller: widget.cardHolderNameController,
          borderLabel: 'Card Holder Name',
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    final newStringBuffer = StringBuffer();

    for (int i = 0; i < newText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        newStringBuffer.write(' ');
      }
      newStringBuffer.write(newText[i]);
    }

    return TextEditingValue(
      text: newStringBuffer.toString(),
      selection: TextSelection.collapsed(offset: newStringBuffer.length),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    final newStringBuffer = StringBuffer();

    for (int i = 0; i < newText.length; i++) {
      if (i == 2) {
        newStringBuffer.write('/');
      }
      newStringBuffer.write(newText[i]);
    }

    return TextEditingValue(
      text: newStringBuffer.toString(),
      selection: TextSelection.collapsed(offset: newStringBuffer.length),
    );
  }
}
