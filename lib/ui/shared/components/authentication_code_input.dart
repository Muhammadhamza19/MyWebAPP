import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';

class AuthenticationCodeInput extends StatefulWidget {
  final Function(String) onOtpEntered;

  const AuthenticationCodeInput({required this.onOtpEntered, Key? key})
      : super(key: key);

  @override
  _AuthenticationCodeInputState createState() =>
      _AuthenticationCodeInputState();
}

class _AuthenticationCodeInputState extends State<AuthenticationCodeInput> {
  final _pin1Controller = TextEditingController();
  final _pin2Controller = TextEditingController();
  final _pin3Controller = TextEditingController();
  final _pin4Controller = TextEditingController();

  final _pin1FocusNode = FocusNode();
  final _pin2FocusNode = FocusNode();
  final _pin3FocusNode = FocusNode();
  final _pin4FocusNode = FocusNode();

  @override
  void dispose() {
    _pin1Controller.dispose();
    _pin2Controller.dispose();
    _pin3Controller.dispose();
    _pin4Controller.dispose();
    _pin1FocusNode.dispose();
    _pin2FocusNode.dispose();
    _pin3FocusNode.dispose();
    _pin4FocusNode.dispose();
    super.dispose();
  }

  void _onPinEntered() {
    final pin = _pin1Controller.text +
        _pin2Controller.text +
        _pin3Controller.text +
        _pin4Controller.text;

    if (pin.length == 4) {
      widget.onOtpEntered(pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildPinField(_pin1Controller, _pin1FocusNode, _pin2FocusNode),
        _buildPinField(_pin2Controller, _pin2FocusNode, _pin3FocusNode),
        _buildPinField(_pin3Controller, _pin3FocusNode, _pin4FocusNode),
        _buildPinField(_pin4Controller, _pin4FocusNode, null),
      ],
    );
  }

  Widget _buildPinField(TextEditingController controller,
      FocusNode currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        autofocus: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus();
              _onPinEntered();
            }
          }
        },
      ),
    );
  }
}
