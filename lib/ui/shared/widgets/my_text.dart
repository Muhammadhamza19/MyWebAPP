import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_theme.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? textScaleFactor;
  final bool toUpper;
  final bool disableTranslationMode;
  final bool addQuotations;
  final String? contextOverride;
  final bool hasTranslationContext;

  const MyText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textScaleFactor,
    this.disableTranslationMode = false,
    this.addQuotations = false,
    this.toUpper = false,
    this.contextOverride,
    this.hasTranslationContext = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TranslatedText(
      text: text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textScaleFactor: textScaleFactor,
      toUpper: toUpper,
      addQuotations: addQuotations,
      contextOverride: contextOverride,
    );
  }
}

class _TranslatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? textScaleFactor;
  final bool? toUpper;
  final bool? addQuotations;
  final String? contextOverride;

  const _TranslatedText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textScaleFactor,
    this.toUpper,
    this.addQuotations,
    this.contextOverride,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translatedString = text;
    if (addQuotations ?? false) {
      translatedString = '"$translatedString"';
    }
    if (toUpper ?? false) {
      translatedString = translatedString.toUpperCase();
    }

    return Text(
      translatedString.tr,
      style: style ?? labelMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      textScaleFactor: textScaleFactor,
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}
