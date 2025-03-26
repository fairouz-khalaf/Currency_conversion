import 'package:flutter/material.dart';

class AppColors {
  static Color get mainAppColor => const Color(0xff4C5FEF);
  static Color get mainAppLightColor => const Color(0xFF243647);
  static Color get dividerAppColor => const Color(0xFF818181).withOpacity(0.4);
  static Color get scaffoldColor => const Color(0xFFFFFFFF);
  static Color get darkBlue => const Color(0xff282837);
  static Color get amberColor => const Color(0xffFBAE2C);
  static Color get lightBlack => const Color(0xff1E1E2C);
  static Color get hintColor => const Color(0xffA2A2A7);
  static Color get pinkColor => const Color(0xffF72585);
  static Color get textFieldWhiteColor => const Color(0xFFf5f5f5);
  static Color get textFieldColor => const Color(0xFFf5f5f5);
  static Color get textColor => const Color(0xFFFFFFFF);
  static Color get blackColor => const Color(0xFF000000);
  static Color get blueColor => const Color(0xff4C5FEF);
  static Color get lightBlue => const Color(0xff58A6FF);
  static Color get moreLightBlue => const Color(0xff718EBF);
  static Color get whiteColor => const Color(0xffFFFFFF);
  static Color get redColor => const Color(0xffE54347);
  static Color get lightGray => const Color(0xffA0AEC0);
  static Color get darkGray => const Color(0xff575757);
  static Color get moreDarkGray => const Color(0xff474747);
  static Color get lightGreen => const Color(0xff20C997);
  static Color get darkGreen => const Color(0xff37914C);
  static Color get bottomNavColor => const Color(0xff18A2A4);
  static Color get purpleColor => const Color(0xff6A0DAD);
  static Color get errorColor => const Color(0xFFBA0000);
  static Color get successColor => const Color(0xff116530);
  static Color get brown => const Color(0xffAB886D);
  static Color get orang => const Color(0xffFFAD60);
  static Color get lightBrown => const Color(0xffA28B55);
  static Color get brightBlue => const Color(0xffCDE7FF);
  static Color get brightGreen => const Color(0xff8CFAC7);
  static Color get lightPurple => const Color(0xffC5A8FF);
  static Color get lightOrange => const Color(0xffFFD5A4);
  static Gradient get buttonGradient1 => LinearGradient(colors: [
        const Color(0xff1C67F8).withOpacity(0.8),
        const Color(0xff9467DD).withOpacity(0.8),
      ]);
  static Gradient get buttonGradient2 => const LinearGradient(colors: [
        Color(0XFFE1E1E1),
        Color(0XFFE1E1E1),
      ]);
  // static Gradient get buttonGradient => const LinearGradient(
  //       begin: Alignment.topLeft,
  //       end: Alignment.bottomRight,
  //       colors: [
  //         Color(0xff1C67F8),
  //         Color(0xffA543FE),
  //       ],
  //     );
  static Gradient get buttonGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF276AFF),
          Color(0xffA2D9F2),
        ],
      );

  static Gradient get buttonGradientFailure => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFE0004),
          Color(0xFFFD5D60),
          Color.fromARGB(255, 248, 155, 156),
        ],
      );

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
