import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

mixin LightThemeMixin {
  SystemUiOverlayStyle lightSystemUiOverlayStyle() => const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      );

  AppBarTheme lightAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.lightWhiteColor,
      elevation: 1,
      shadowColor: AppColors.lightWhiteColor,
      surfaceTintColor: AppColors.lightWhiteColor,
      systemOverlayStyle: lightSystemUiOverlayStyle(),
      scrolledUnderElevation: 0,
    );
  }

  TextButtonThemeData lightTextButtonTheme() {
    return TextButtonThemeData(
      style: const ButtonStyle().copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.lightWhiteColor),
        elevation: MaterialStateProperty.all(0.0),
      ),
    );
  }

  ProgressIndicatorThemeData lightProgressIndicatorTheme() {
    return const ProgressIndicatorThemeData(
      color: AppColors.lightPrimaryColor,
      circularTrackColor: AppColors.lightPrimaryLightColor,
      refreshBackgroundColor: AppColors.lightWhiteGreyColor,
    );
  }

  TabBarThemeData lightTabBarTheme() {
    return const TabBarThemeData().copyWith(
      unselectedLabelColor: AppColors.lightBlackColor,
      labelColor: AppColors.lightDeepBlackColor,
      labelStyle: AppStyles.textfieldHintTextStyel.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.f14,
      ),
      unselectedLabelStyle: AppStyles.textfieldHintTextStyel.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.f14,
      ),
    );
  }

  TextTheme lightTextTheme() {
    return const TextTheme().copyWith(
      headlineLarge: AppStyles.style24Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      headlineMedium: AppStyles.style18Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      bodyLarge: AppStyles.style16Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      bodyMedium: AppStyles.style14Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      bodySmall: AppStyles.style12Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      //title 16 medium and small 13
      titleMedium: AppStyles.style16Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      titleSmall: AppStyles.style13Normal.copyWith(
        color: AppColors.lightBodyTextColor,
      ),
      labelSmall: AppStyles.style10Normal.copyWith(
        color: AppColors.lightLabelSmallTextColor,
      ),
      //dont use for text
      titleLarge: const TextStyle(color: AppColors.lightWhiteColor),
    );
  }

  InputDecorationTheme lightInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      helperMaxLines: 2,
      fillColor: AppColors.lightWhiteColor,
      constraints: BoxConstraints(
        minHeight: Dimens.h20,
        maxWidth: Dimens.screenWidth,
      ),
      contentPadding: Dimens.edgeH12,
      labelStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.lightPrimaryLightColor,
      ),
      floatingLabelStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.lightBodyTextColor,
        fontWeight: FontWeight.bold,
        fontSize: Dimens.f14,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      hintStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.lightGreyColorShade,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.lightErrorColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightDividerColor,
          width: 1,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightDividerColor.withAlpha(20),
          width: Dimens.pointFive,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightDividerColor,
          width: Dimens.pointEight,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightPrimaryColor,
          width: Dimens.pointEight,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightErrorColor,
          width: Dimens.pointEight,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightErrorColor,
          width: Dimens.pointEight,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
    );
  }

  OutlinedButtonThemeData lightOutlineButtonTheme() {
    return OutlinedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all(AppColors.lightWhiteColor),
        foregroundColor: MaterialStateProperty.all(AppColors.lightWhiteColor),
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: Dimens.circularBorderRadius,
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(color: AppColors.lightPrimaryColor),
        ),
      ),
    );
  }

  BottomSheetThemeData ligthBottomSheetTheme() {
    return const BottomSheetThemeData().copyWith(
      backgroundColor: AppColors.lightBottomSheetBackgroundColor,
      surfaceTintColor: AppColors.lightBottomSheetSurfaceTintColor,
      modalBackgroundColor: AppColors.lightWhiteColor,
      modalBarrierColor: AppColors.lightBottomSheetBarrierColor,
    );
  }

  ElevatedButtonThemeData lightElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.lightWhiteColor),
        elevation: MaterialStateProperty.all(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

  //snackbar
  SnackBarThemeData lightSnackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: AppColors.lightPrimaryColor,
      contentTextStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.lightWhiteColor,
      ),
      actionTextColor: AppColors.lightPrimaryColor,
    );
  }

  DividerThemeData lightDividerTheme() {
    return const DividerThemeData(
      color: AppColors.lightDividerColor,
      thickness: 1,
    );
  }

  DialogThemeData lightDialogTheme() {
    return DialogThemeData(
      backgroundColor: AppColors.lightDialogColor,
      surfaceTintColor: AppColors.lightPrimaryColor,
      titleTextStyle: AppStyles.style16Black,
    );
  }
}
