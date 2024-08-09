import 'package:get/get.dart';
import 'package:local_grocery/view_models/user_view_model.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_strings.dart';

/// app height
// double height({BuildContext? context}) {
//   return MediaQuery.of(context ?? Get.context).size.height;
// }

// /// app width
// double width({BuildContext? context}) {
//   return MediaQuery.of(context ?? Get.context!).size.width;
// }

/// padding
const kPaddingEdges4 = EdgeInsets.symmetric(horizontal: 4);
const kPaddingEdges8 = EdgeInsets.symmetric(horizontal: 8);
const kPaddingEdges12 = EdgeInsets.symmetric(horizontal: 12);
const kPaddingEdges16 = EdgeInsets.symmetric(horizontal: 16);
const kPaddingEdges20 = EdgeInsets.symmetric(horizontal: 20);
const kPaddingEdges24 = EdgeInsets.symmetric(horizontal: 24);
const kPaddingEdges28 = EdgeInsets.symmetric(horizontal: 28);
const kPaddingEdges32 = EdgeInsets.symmetric(horizontal: 32);

/// height
const double kButtonHeight = 48;

/// border radius
final BorderRadius kBorderRadius12 = BorderRadius.circular(12);

/// generic gap height
const hGap4 = SizedBox(height: 4);
const hGap8 = SizedBox(height: 8);
const hGap12 = SizedBox(height: 12);
const hGap16 = SizedBox(height: 16);
const hGap20 = SizedBox(height: 20);
const hGap24 = SizedBox(height: 24);
const hGap28 = SizedBox(height: 28);
const hGap32 = SizedBox(height: 32);

/// generic gap width
const wGap4 = SizedBox(width: 4);
const wGap8 = SizedBox(width: 8);
const wGap12 = SizedBox(width: 12);
const wGap16 = SizedBox(width: 16);
const wGap20 = SizedBox(width: 20);
const wGap24 = SizedBox(width: 24);
const wGap28 = SizedBox(width: 28);
const wGap32 = SizedBox(width: 32);

/// Text theme secondary color
/// body color always primary color
/// label color always secondary color
/// title color always secondary color
TextTheme _textTheme({bool isDark = false}) {
  return TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: isDark ? backgroundColor : secondaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: 26,
      color: isDark ? backgroundColor : secondaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: isDark ? backgroundColor : secondaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: isDark ? backgroundColor : secondaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: primaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: primaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w900,
      color: isDark ? backgroundColor : secondaryColor,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      color: isDark ? backgroundColor : secondaryColor,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: isDark ? backgroundColor : secondaryColor,
    ),
  );
}

/// Button - primary
get primaryButtonStyle => ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16, vertical: 15);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return secondaryColor;
        return primaryColor;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return backgroundColor;
        return backgroundColor;
      }),
    );

/// Button - secondary
get secondaryButtonStyle => ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return RoundedRectangleBorder(
          side: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16, vertical: 15);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return secondaryColor;
        return backgroundColor;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return primaryColor;
        return primaryColor;
      }),
    );

/// Button - disable
get disableButtonStyle => ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return Colors.grey[400]!;
        return Colors.grey[400]!;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return backgroundColor;
        return backgroundColor;
      }),
    );

/// textfield
textFieldDecoration(String label,
        {IconData? prefixIcon,
        IconData? suffixIcon,
        void Function()? onTapSuffix}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.white,
      filled: true,
      contentPadding:
          EdgeInsets.only(left: 30.0, top: 15.0, right: 15.0, bottom: 15.0),
      hintText: label,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: Icon(
          prefixIcon,
          size: 35,
          color: Colors.grey[500],
        ),
      ),
      prefixStyle: Theme.of(Get.context!).textTheme.labelLarge,
      suffixStyle: Theme.of(Get.context!).textTheme.labelLarge,
      suffixIcon: GestureDetector(
        onTap: onTapSuffix,
        child: Icon(
          suffixIcon,
          color: Colors.grey[500],
        ),
      ),
      hintStyle: Theme.of(Get.context!).textTheme.labelLarge,
      enabledBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.only(),
        borderSide: BorderSide(color: greyColor, width: 1.0),
      ),
      focusedBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: greyColor, width: 1.0),
      ),
      border: UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: greyColor, width: 1.0),
      ),
      disabledBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: greyColor, width: 1.0),
      ),
      errorBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
    );

/// date and time theme
get timePickerTheme => TimePickerThemeData(
      backgroundColor: backgroundColor,
      hourMinuteColor: primaryColor,
      hourMinuteTextColor: backgroundColor,
      dialHandColor: greenColor[700],
      dialBackgroundColor: primaryColor,
      entryModeIconColor: primaryColor,
      dayPeriodColor: backgroundColor,
      dialTextColor: backgroundColor,
    );

/// dialog theme
get dialogTheme => DialogTheme(
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ));

get checkboxTheme => CheckboxThemeData(
      fillColor: MaterialStateProperty.all(backgroundColor),
      checkColor: MaterialStateProperty.all(primaryColor),
      side: MaterialStateBorderSide.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return BorderSide(
              color: backgroundColor,
              width: 2,
            );
          }
          return BorderSide(
            color: borderColor,
            width: 2,
          );
        },
      ),
    );

/// card theme
get cardTheme => CardTheme(
      margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: backgroundColor,
          width: 1.0,
        ),
      ),
      elevation: 3.0,
    );

/// messages theme
showInfoMessage(String text) {
  Get.snackbar(
    'info'.tr,
    text,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.yellow,
    colorText: Colors.white,
  );
}

showSuccessMessage(String text) {
  Get.snackbar(
    'success'.tr,
    text,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}

showErrorMessage(String text) {
  Get.snackbar(
    'error'.tr,
    text,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}

/// light and dark theme
get lightTheme => ThemeData(
      fontFamily: 'Popins',
      useMaterial3: false,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      textTheme: _textTheme(isDark: false),
      canvasColor: backgroundColor,
      timePickerTheme: timePickerTheme,
      dialogTheme: dialogTheme,
      cardTheme: cardTheme,
      checkboxTheme: checkboxTheme,
    );
get darkTheme => ThemeData(
      fontFamily: 'Popins',
      useMaterial3: false,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: secondaryColor,
      textTheme: _textTheme(isDark: true),
      canvasColor: backgroundColor,
      timePickerTheme: timePickerTheme,
      dialogTheme: dialogTheme,
      cardTheme: cardTheme,
      checkboxTheme: checkboxTheme,
    );

/// text theme
get titleLarge => Theme.of(Get.context!).textTheme.titleLarge;
get titleMedium => Theme.of(Get.context!).textTheme.titleMedium;
get titleSmall => Theme.of(Get.context!).textTheme.titleSmall;

get primaryLarge => Theme.of(Get.context!).textTheme.bodyLarge;
get primaryMedium => Theme.of(Get.context!).textTheme.bodyMedium;
get primarySmall => Theme.of(Get.context!).textTheme.bodySmall;

get labelLarge => Theme.of(Get.context!).textTheme.labelLarge;
get labelMedium => Theme.of(Get.context!).textTheme.labelMedium;
get labelSmall => Theme.of(Get.context!).textTheme.labelSmall;
get displayMedium => Theme.of(Get.context!).textTheme.displayMedium;
get isDark => UserViewModel.load().isDarkTheme.value;
