import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const double dPadding = 20.0;

  static const Color amber = Color(0xFFFFC107);
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);


  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFFFFFF);
  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const TextTheme textTheme = TextTheme(
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyLarge: body2,
    bodyMedium: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle( // headlineMedium -> display1
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle( // headlineSmall -> headline
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle( // titleLarge -> title
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle( // titleSmall -> subtitle
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle( // bodyMedium -> body2
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // bodyLarge -> body1
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle( // bodySmall -> caption
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, 
  );
}
