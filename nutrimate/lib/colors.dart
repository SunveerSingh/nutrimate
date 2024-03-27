import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

class CustomColors {
  static const kLightPinkColor = Color(0xffF3BBEC);
  static const kYellowColor = Color(0xffF3AA26);
  static const kCyanColor = Color(0xff0eaeb4);
  static const kPurpleColor = Color(0xff533DC6);
  static const kPrimaryColor = Color(0xff39439f);
  static const kBackgroundColor = Color(0xffF3F3F3);
  static const kLightColor = Color(0xffc4bbcc);
}

class CustomTextStyle {
  static const dayTabBarStyleInactive = TextStyle(
    color: CustomColors.kLightColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const dayTabBarStyleActive = TextStyle(
    color: CustomColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const metricTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);
}
