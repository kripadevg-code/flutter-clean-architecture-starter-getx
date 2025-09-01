import 'package:flutter/material.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:pinput/pinput.dart';

abstract class AppStyles {
  static const Color kShadowColor = Color.fromARGB(255, 0, 0, 0);

  static String get defaultFontFamily => '';

  static double get defaultHeight => 1.2;

  static TextStyle style10Bold = TextStyle(
    fontSize: Dimens.f10,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style10Normal = TextStyle(
    fontSize: Dimens.f10,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style11Bold = TextStyle(
    fontSize: Dimens.f11,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style11Normal = TextStyle(
    fontSize: Dimens.f11,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style12Bold = TextStyle(
    fontSize: Dimens.f12,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style12Normal = TextStyle(
    fontSize: Dimens.f12,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );
  static TextStyle style12NormalUnderLine = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: Dimens.f12,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style13Black = TextStyle(
    fontSize: Dimens.f13,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style13Bold = TextStyle(
    fontSize: Dimens.f13,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style13Normal = TextStyle(
    fontSize: Dimens.f13,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style14Black = TextStyle(
    fontSize: Dimens.f14,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style14LightBold = TextStyle(
    fontSize: Dimens.f14,
    fontWeight: FontWeight.w500,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style14Bold = TextStyle(
    fontSize: Dimens.f14,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style14Normal1 = TextStyle(
    fontSize: Dimens.f14,
    fontWeight: FontWeight.w500,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle style14Normal = TextStyle(
    fontSize: Dimens.f14,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle style15Black = TextStyle(
    fontSize: Dimens.f15,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style15Bold = TextStyle(
    fontSize: Dimens.f15,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style15Normal = TextStyle(
    fontSize: Dimens.f15,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style16Black = TextStyle(
    fontSize: Dimens.f16,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style16Bold = TextStyle(
    fontSize: Dimens.f16,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style16Normal = TextStyle(
    fontSize: Dimens.f16,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style18Bold = TextStyle(
    fontSize: Dimens.f18,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style18Normal = TextStyle(
    fontSize: Dimens.f18,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style20Black = TextStyle(
    fontSize: Dimens.f20,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style20Bold = TextStyle(
    fontSize: Dimens.f20,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style20Normal = TextStyle(
    fontSize: Dimens.f20,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style24Black = TextStyle(
    fontSize: Dimens.f20,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style24Bold = TextStyle(
    fontSize: Dimens.f12 * 2,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style24Normal = TextStyle(
    fontSize: Dimens.f12 * 2,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style28Bold = TextStyle(
    fontSize: Dimens.f14 * 2,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style28Normal = TextStyle(
    fontSize: Dimens.f14 * 2,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style32Black = TextStyle(
    fontSize: Dimens.f16 * 2,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style32Bold = TextStyle(
    fontSize: Dimens.f16 * 2,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style32Normal = TextStyle(
    fontSize: Dimens.f16 * 2,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style36Black = TextStyle(
    fontSize: Dimens.f18 * 2,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style36Bold = TextStyle(
    fontSize: Dimens.f16 * 2,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style36Normal = TextStyle(
    fontSize: Dimens.f16 * 2,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style40Black = TextStyle(
    fontSize: Dimens.f20 * 2,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style40Bold = TextStyle(
    fontSize: Dimens.f20 * 2,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style40Normal = TextStyle(
    fontSize: Dimens.f20 * 2,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style48Black = TextStyle(
    fontSize: Dimens.f20 * 2.4,
    fontWeight: FontWeight.w900,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style48Bold = TextStyle(
    fontSize: Dimens.f20 * 2.4,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style48Normal = TextStyle(
    fontSize: Dimens.f20 * 2.4,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static get cardShadow => const [
        BoxShadow(
          color: AppColors.lightCardShadowColor,
          offset: Offset(0, 1),
          blurRadius: 2,
        )
      ];

  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: kShadowColor.withAlpha(14),
          blurRadius: Dimens.f4,
          spreadRadius: 0,
          offset: const Offset(0, 0),
        ),
        BoxShadow(
          color: kShadowColor.withAlpha(12),
          blurRadius: Dimens.f3,
          spreadRadius: -0,
          offset: const Offset(0, 0),
        ),
        BoxShadow(
          color: kShadowColor.withAlpha(2),
          blurRadius: Dimens.f8,
          spreadRadius: 0,
          offset: Offset(0, Dimens.f1),
        ),
      ];

  static List<BoxShadow> get cardBoxShadow => const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), offset: Offset(0, 1), blurRadius: 2)];

  static List<BoxShadow> get bottomNavbarShadow => [
        BoxShadow(
          color: kShadowColor.withAlpha(14),
          blurRadius: Dimens.f4,
          spreadRadius: Dimens.f3,
          offset: Offset(0, Dimens.f3),
        ),
        BoxShadow(
          color: kShadowColor.withAlpha(12),
          blurRadius: Dimens.f4,
          spreadRadius: -Dimens.f2,
          offset: Offset(0, Dimens.f3),
        ),
        BoxShadow(
          color: kShadowColor.withAlpha(2),
          blurRadius: Dimens.f10,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ];

  static TextStyle get textfieldHintTextStyel => TextStyle(color: Colors.grey, fontSize: Dimens.f14);
  static TextStyle textfieldLabelTextStyle(BuildContext context) => TextStyle(fontSize: Dimens.f16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600);

//Theme style

  static PinTheme defaultPinTheme(BuildContext context) => PinTheme(
        width: Dimens.w20 * 2.25,
        height: Dimens.h20 * 2.4,
        textStyle: AppStyles.style16Bold,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColors.lightPinputBorderColor),
          borderRadius: Dimens.circularBorderRadius,
          color: AppColors.lightPinputBackgroundColor,
        ),
      );

  static PinTheme focusedPinTheme(BuildContext context) => defaultPinTheme(context).copyDecorationWith(
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).primaryColor,
        ),
      );

  static PinTheme submittedPinTheme(BuildContext context) => defaultPinTheme(context).copyWith(
        decoration: defaultPinTheme(context).decoration!.copyWith(color: Theme.of(context).dividerColor),
      );
}
