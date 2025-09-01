import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/global/k_theme_config.dart';
import 'package:healthbuxus/services/pre_app_services/hive_services.dart';
import 'package:healthbuxus/themes/mixins/dark_theme_mixin.dart';
import 'package:healthbuxus/themes/mixins/light_theme_mixin.dart';
import 'package:healthbuxus/utils/app_colors.dart';

class AppThemeController extends GetxController with LightThemeMixin, DarkThemeMixin {
  static AppThemeController get find => Get.find();
  final _themeMode = kSystemMode.obs;
  //getters
  String get themeMode => _themeMode.value;

  @override
  void onInit() {
    super.onInit();
    getThemeMode();
  }

  //setters
  void setThemeMode(String mode) async {
    _themeMode.value = mode;
    await HiveService.put<String>(kThemeModeBox, kThemeModeKey, mode);
    update();
  }

//getThemeMode
  void getThemeMode() async {
    var themeMode = await HiveService.get<String>(kThemeModeBox, kThemeModeKey);

    switch (themeMode) {
      case kSystemMode:
        _themeMode.value = kSystemMode;
        break;
      case kLightMode:
        _themeMode.value = kLightMode;
        break;
      case kDarkMode:
        _themeMode.value = kDarkMode;
        break;
      default:
        _themeMode.value = kSystemMode;
        break;
    }
    update();
  }

  //getSystem chromeData
  void _getSystemChromeData(BuildContext context) {
    var themeBrightness = Theme.of(context).brightness;
    if (_themeMode.value == kLightMode) {
      SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle());
    } else if (_themeMode.value == kDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(darkSystemUIOverlayStyle());
    } else {
      if (themeBrightness == Brightness.light) {
        // AppUtility.log("light mode");
        SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle());
      } else {
        // AppUtility.log("Dark mode");
        SystemChrome.setSystemUIOverlayStyle(darkSystemUIOverlayStyle());
      }
    }
  }

  ThemeData getLightThemeData(BuildContext context) {
    _getSystemChromeData(context);
    return ThemeData().copyWith(
      primaryColor: AppColors.lightPrimaryColor,
      primaryColorLight: AppColors.lightPrimaryLightColor,
      iconTheme: IconThemeData(color: AppColors.lightGreyColorShade),
      scaffoldBackgroundColor: AppColors.lightScafoldBgColor,
      appBarTheme: lightAppBarTheme(),
      cardColor: AppColors.lightWhiteColor,
      cardTheme: const CardThemeData(color: AppColors.lightDialogColor),
      dialogTheme: lightDialogTheme(),
      bottomSheetTheme: ligthBottomSheetTheme(),
      dividerTheme: lightDividerTheme(),
      disabledColor: AppColors.lightGrayColor,
      snackBarTheme: lightSnackBarTheme(),
      elevatedButtonTheme: lightElevatedButtonTheme(),
      outlinedButtonTheme: lightOutlineButtonTheme(),
      dividerColor: AppColors.lightBgColor,
      inputDecorationTheme: lightInputDecorationTheme(),
      textTheme: lightTextTheme(),
      textButtonTheme: lightTextButtonTheme(),
      tabBarTheme: lightTabBarTheme(),
      progressIndicatorTheme: lightProgressIndicatorTheme(),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      hintColor: AppColors.lightHintTextColor,
      canvasColor: AppColors.lightWhiteColor,
    );
  }

  ThemeData getDarkThemeData(BuildContext context) {
    _getSystemChromeData(context);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.lightPrimaryColor, //need chaneg for dark them
      primaryColorLight: AppColors.lightPrimaryLightColor, //need chaneg for dark them
      iconTheme: const IconThemeData(color: AppColors.darkGrayColor),
      scaffoldBackgroundColor: AppColors.darkBgColor,
      appBarTheme: darkAppBarTheme(),
      cardColor: AppColors.darkDialogColor,
      cardTheme: const CardThemeData(color: AppColors.darkDialogColor),
      dialogTheme: darkDialogTheme(),
      bottomSheetTheme: darkBottomSheetTheme(),
      dividerColor: AppColors.darkDividerColor,
      disabledColor: AppColors.darkGrayColor,
      snackBarTheme: darkSnackBarTheme(),
      elevatedButtonTheme: darkElevatedButtonTheme(),
      inputDecorationTheme: darkInputDecorationTheme(),
      fontFamily: kDefaultFontFamily,
      textTheme: darkTextTheme(),
      tabBarTheme: darkTabBarTheme(),
      progressIndicatorTheme: darkProgressIndicatorTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
