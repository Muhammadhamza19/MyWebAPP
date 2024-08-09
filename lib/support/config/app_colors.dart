import 'package:flutter/material.dart';

/// main app color
MaterialColor primaryColor = createMaterialColor(
  _primaryColor,
);

/// secondary app color
MaterialColor secondaryColor = createMaterialColor(
  _secondaryColor,
);

/// background color
Color backgroundColor = _backgroundColor;

/// other colors
MaterialColor redColor = createMaterialColor(
  Color(
    0xFFF03E3E,
  ),
);
MaterialColor greenColor = createMaterialColor(
  Color(
    0xFF4CAF50,
  ),
);
MaterialColor greyColor = createMaterialColor(
  Color(
    0xFF666666,
  ),
);

const Color borderColor = Color(
  0xFFB0BEC5,
);

/// primary color by flavor
Color get _primaryColor {
  return const Color(
    0xFFF29700,
  );
}

/// secondary color by flavor
Color get _secondaryColor {
  return Color(
    0xFF333333,
  );
}

/// background color by flavor
Color get _backgroundColor {
  
  
      return Color.fromARGB(
        255,
        255,
        255,
        255,
      );
  
}

/// material color generator
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
