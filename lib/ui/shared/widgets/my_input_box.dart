import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class MyInputBox extends StatefulWidget {
  final String? borderLabel;
  final bool labelBold;
  final String? inputValue;
  final Function? clearValue;
  final Function? deleteValue;
  final String? keyIndex;
  final Function()? onTap;
  final Color? borderColor;
  final Color? iconColor;
  final bool disable;
  final bool? enableInteractiveSelection;
  final TextInputType? keyboardType;
  final int? maxLines;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool? obscureText;
  final bool? autofocus;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? translate;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Widget? innerWidget;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool translateInputValue;
  final Color? suffixColor;
  final Color? labelColor;
  const MyInputBox({
    this.borderLabel,
    this.labelBold = false,
    this.inputValue,
    this.translateInputValue = false,
    this.clearValue,
    this.deleteValue,
    this.keyIndex,
    this.onTap,
    this.borderColor,
    this.disable = false,
    this.enableInteractiveSelection,
    this.keyboardType,
    this.maxLines,
    this.labelColor,
    this.icon,
    this.iconColor,
    this.suffixIcon,
    this.textInputAction,
    this.focusNode,
    this.obscureText,
    this.translate,
    this.autofocus,
    this.controller,
    this.onChanged,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.innerWidget,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.suffixColor,
  });

  @override
  _MyInputBoxState createState() => _MyInputBoxState();
}

class _MyInputBoxState extends State<MyInputBox> {
  _MyInputBoxState();

  bool get isKeyboardInput =>
      widget.onChanged != null || widget.controller != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('inputBox_${widget.keyIndex ?? ""}'),
      child: GestureDetector(
          onTap: widget.disable ? null : widget.onTap, child: _inputBox()),
    );
  }

  Widget _inputBox() {
    return isKeyboardInput
        ? TextFormField(
            style: const TextStyle(fontSize: 12.0),
            initialValue: widget.inputValue,
            enableInteractiveSelection:
                widget.enableInteractiveSelection ?? false,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            maxLines: widget.maxLines ?? 1,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus ?? false,
            controller: widget.controller,
            obscureText: widget.obscureText ?? false,
            onFieldSubmitted: widget.onFieldSubmitted,
            inputFormatters: widget.inputFormatters ?? [],
            decoration: inputBoxDecoration(
                fillColor: widget.disable
                    ? Colors.grey
                    : isDark
                        ? secondaryColor
                        : backgroundColor,
                label: widget.borderLabel ?? '',
                labelBold: widget.labelBold,
                labelColor: widget.labelColor ?? primaryColor,
                icon: widget.icon,
                suffixColor: widget.suffixColor ?? borderColor,
                suffixIcon: widget.suffixIcon,
                iconColor: widget.iconColor ??
                    primaryColor, // replace `primaryColor` with actual color if needed
                enabledBorderColor: widget.borderColor ?? borderColor,
                floatingLabelBehavior: widget.floatingLabelBehavior,
                onTranslate: widget.translate ?? () {}),
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            onChanged: widget.onChanged)
        : InputDecorator(
            decoration: inputBoxDecoration(
                fillColor: widget.disable
                    ? Colors.grey
                    : isDark
                        ? secondaryColor
                        : backgroundColor,
                icon: widget.icon,
                suffixColor: widget.suffixColor ?? borderColor,
                suffixIcon: widget.suffixIcon,
                iconColor: widget.iconColor ??
                    primaryColor, // replace `primaryColor` with actual color if needed
                label: widget.borderLabel ?? '',
                labelBold: widget.labelBold,
                labelColor: widget.labelColor ?? primaryColor,
                floatingLabelBehavior: widget.floatingLabelBehavior,
                enabledBorderColor: widget.borderColor ??
                    Colors.blue, // use a default color or `primaryColor`
                onTranslate: widget.translate ?? () {}),
            child: widget.innerWidget ??
                Row(
                  children: <Widget>[
                    Expanded(
                        child: widget.translateInputValue
                            ? MyText(
                                // Make sure to define or replace `TranslatedText`
                                widget.inputValue ?? '',
                                style: const TextStyle(fontSize: 13.0))
                            : Text(
                                widget.inputValue ?? '',
                                style: const TextStyle(fontSize: 13.0),
                              )),
                    if (widget.clearValue != null && widget.deleteValue != null)
                      Expanded(child: Container()),
                    if (widget.clearValue != null && widget.deleteValue != null)
                      GestureDetector(
                          onTap: () => widget.deleteValue!(),
                          onLongPress: () => widget.clearValue!(),
                          child: const Icon(
                            Icons.backspace,
                            color: Colors
                                .blue, // replace `primaryColor` with actual color if needed
                          )),
                  ],
                ),
          );
  }

  InputDecoration inputBoxDecoration({
    required String label,
    required bool labelBold,
    required IconData? icon,
    required IconData? suffixIcon,
    required Color iconColor,
    required Color labelColor,
    required Color suffixColor,
    required Color? enabledBorderColor,
    required Color fillColor,
    required FloatingLabelBehavior floatingLabelBehavior,
    required Function onTranslate,
  }) {
    return InputDecoration(
      labelText: label,
      alignLabelWithHint: true,
      labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: isDark ? primaryColor : labelColor,
            fontWeight: labelBold ? FontWeight.bold : null,
          ),
      floatingLabelBehavior: floatingLabelBehavior,
      fillColor: fillColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: isDark ? backgroundColor : primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: isDark ? primaryColor : enabledBorderColor!,
        ),
      ),
      prefixIcon: icon != null ? Icon(icon, color: iconColor) : null,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(
                suffixIcon,
                color: suffixColor,
              ),
              onPressed: onTranslate as void Function()?)
          : null,
    );
  }
}
