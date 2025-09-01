import 'package:flutter/material.dart';

class AppColors {
  //********************************** Light Theme Colors *****************************//

  static const lightPrimaryColor = Color(0xFF1E87FA);
  static const lightPrimaryLightColor = Color(0xFFE5F2FF);

  static const lightBlackColor = Color(0xFF2D2D32);
  static const lightDeepBlackColor = Color(0xFF000000);
  static const lightSuccessColor = Colors.green;
  static const lightWhiteColor = Colors.white;

  static const lightScafoldBgColor = Color(0xFFF8F8F8);
  static const lightLabelSmallTextColor = Color(0xFF606570);

  static const lightBgColor = Color(0xFFF0F0F0);
  static const lightChatBubbleColor = Color(0xFFF2F2F2);
  static const lightDividerColor = Color(0xFFD8D8E3);

  //1.Light Text Colors
  static const lightBodyTextColor = Color(0xFF1E1E1E);
  static const lightDialogColor = Color(0xFFFCFCFC);
  static const lighTitleSmallTextColor = Color(0xFF8C8C8C);
  static const lightSubtitleTextColor = Color(0xFF646464);
  static const lightHintTextColor = Color(0xFF09101D);

  //2.Light Card Color
  static const lightCardShadowColor = Color(0x1A000000);
  static const lightErrorColor = Colors.red;
  //3.Light Grey Color
  static Color lightGreyColorShade = Colors.grey.shade400;
  static const lightGrayColor = Color(0xFFD2D2D2);
  static const lightWhiteGreyColor = Color(0xFFECF1F4);
  //4.Bottom Sheets Color
  static var lightBottomSheetBarrierColor = AppColors.lightBlackColor.withOpacity(0.5);
  static const lightBottomSheetBackgroundColor = lightDialogColor;
  static const lightBottomSheetSurfaceTintColor = lightDialogColor;
  static const lightBottomSheetmodalBackgroundColor = lightWhiteColor;

  //SignIn
  static const lightSignInTabItemColor = Color(0xFFAFD3FA);
  static const lightDisabledColor = Color(0xFF858C94);
  static const lightSocialBackgroundColor = Color(0xFFE0E7FF);
  static const lightPinputBackgroundColor = Color(0xFFF5F5F5);
  static const lightPinputBorderColor = Color(0xFF858C94);

//************************************** Dark Theme Colors **************************************//
  //Dark Others Color
  static const darkBgColor = Color.fromARGB(255, 10, 10, 16);
  static const darkDialogColor = Color.fromARGB(255, 36, 36, 56);
  static const darkErrorColor = Colors.red;
  static const darkDividerColor = Color.fromARGB(255, 70, 70, 70);
  //1.Dark Text Colors
  static const darkBodyLargeTextColor = Color.fromARGB(255, 240, 240, 240);
  static const darkBodyMediumTextColor = Color.fromARGB(255, 240, 240, 240);
  static const darkBodySmallTextColor = Color.fromARGB(255, 240, 240, 240);
  static const darkTitleMediumTextColor = Color.fromARGB(255, 240, 240, 240);
  //2.GreyC Color
  static const darkGrayColor = Color.fromARGB(255, 120, 120, 120);

  static const lightBorderColor = Color(0xFFAFD3FA);
}
