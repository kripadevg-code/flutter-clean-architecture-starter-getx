import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

mixin DarkThemeMixin {
  SystemUiOverlayStyle darkSystemUIOverlayStyle() => const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBgColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.darkBgColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      );

  DialogThemeData darkDialogTheme() => const DialogThemeData(
        backgroundColor: AppColors.darkDialogColor,
      );

  SnackBarThemeData darkSnackBarTheme() {
    return const SnackBarThemeData(
      backgroundColor: AppColors.lightBgColor,
      contentTextStyle: TextStyle(
        color: AppColors.lightBodyTextColor,
      ),
      actionTextColor: AppColors.lightPrimaryColor,
    );
  }

  ProgressIndicatorThemeData darkProgressIndicatorTheme() {
    return const ProgressIndicatorThemeData(
      color: AppColors.lightWhiteColor,
      circularTrackColor: AppColors.lightWhiteColor,
    );
  }

  TabBarThemeData darkTabBarTheme() {
    return const TabBarThemeData().copyWith(
      unselectedLabelColor: AppColors.lightWhiteColor.withAlpha(200),
      labelColor: AppColors.lightWhiteColor,
      labelStyle: AppStyles.style16Normal.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColors.lightWhiteColor,
      ),
      unselectedLabelStyle: AppStyles.style16Normal.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.lightWhiteGreyColor,
      ),
    );
  }

  TextTheme darkTextTheme() {
    return const TextTheme().copyWith(
      bodyLarge: const TextStyle(
        color: AppColors.darkBodyLargeTextColor,
      ),
      bodyMedium: const TextStyle(
        color: AppColors.darkBodyMediumTextColor,
      ),
      bodySmall: const TextStyle(
        color: AppColors.darkBodySmallTextColor,
      ),
      titleMedium: TextStyle(
        color: AppColors.darkTitleMediumTextColor.withAlpha(180),
      ),
      titleSmall: TextStyle(
        color: AppColors.darkTitleMediumTextColor.withAlpha(140),
      ),
      titleLarge: const TextStyle(color: AppColors.lightWhiteColor),
    );
  }

  InputDecorationTheme darkInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkDialogColor,
      constraints: BoxConstraints(
        minHeight: Dimens.h20 * 2.8,
        maxWidth: Dimens.screenWidth,
      ),
      labelStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.darkBodySmallTextColor,
      ),
      floatingLabelStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.darkBodySmallTextColor.withAlpha(140),
      ),
      hintStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.darkBodySmallTextColor.withAlpha(140),
      ),
      errorStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.darkErrorColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkDividerColor,
          width: Dimens.pointFive,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkErrorColor,
          width: Dimens.pointFive,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkDividerColor,
          width: Dimens.pointFive,
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
          color: AppColors.darkErrorColor,
          width: Dimens.pointEight,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkErrorColor,
          width: Dimens.pointEight,
        ),
        borderRadius: Dimens.circularBorderRadius,
      ),
    );
  }

  ElevatedButtonThemeData darkElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: WidgetStateProperty.all(AppColors.lightPrimaryColor),
        foregroundColor: WidgetStateProperty.all(AppColors.lightWhiteColor),
        elevation: WidgetStateProperty.all(0.0),
      ),
    );
  }

  BottomSheetThemeData darkBottomSheetTheme() {
    return const BottomSheetThemeData().copyWith(
      backgroundColor: AppColors.darkDialogColor,
      surfaceTintColor: AppColors.darkDialogColor,
      modalBackgroundColor: AppColors.darkDialogColor,
      modalBarrierColor: AppColors.lightBlackColor.withValues(alpha: 0.5),
    );
  }

  AppBarTheme darkAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      elevation: 0,
      systemOverlayStyle: darkSystemUIOverlayStyle(),
    );
  }
}
