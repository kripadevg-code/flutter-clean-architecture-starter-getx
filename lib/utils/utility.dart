import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/constants/app_string.dart';
import 'package:healthbuxus/enums/enum_type.dart';
import 'package:healthbuxus/extensions/string_extension.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_decoration.dart';
import 'package:healthbuxus/widgets/common/ayush_text_btn.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'styles/app_text_style.dart';

abstract class AppUtility {
  /// _Logger
  static final _logger = TalkerFlutter.init();
  static void log(dynamic message, {LogType? tag}) {
    switch (tag) {
      case LogType.error:
        _logger.error(message);
        break;
      case LogType.verbose:
        _logger.verbose(message);
        break;
      case LogType.info:
        _logger.info(message);
        break;
      case LogType.debug:
        _logger.debug(message);
        break;
      case LogType.critical:
        _logger.critical(message);
        break;
      default:
        _logger.warning(message);
        break;
    }
  }

  /// Close any open snack bar.
  static void closeSnackBar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open bottom sheet.
  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  static void closeFocus() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Show Loading Dialog

  static void showLoadingDialog({
    double? value,
    bool? barrierDismissible,
    String? message,
  }) {
    closeSnackBar();
    closeDialog();
    Get.dialog(
      PopScope(
        onPopInvoked: (_) async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: Dimens.edgA16,
              margin: Dimens.edgA16,
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).dialogTheme.backgroundColor,
                borderRadius: BorderRadius.circular(Dimens.r8),
              ),
              constraints: BoxConstraints(
                maxWidth: Dimens.screenWidth / 2.8,
                maxHeight: Dimens.screenHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  Dimens.boxHeight12,
                  Text(
                    message ?? AppString.pleaseWait,
                    style: AppStyles.style14Normal.copyWith(
                      color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible ?? false,
      name: 'loading_dialog',
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }

  static void showSimpleDialog({
    required Widget child,
    bool barrierDismissible = false,
    double? height,
    double? width,
  }) {
    closeSnackBar();
    closeDialog();
    Get.dialog(
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Dimens.screenHeight / 5,
          maxHeight: height ?? Dimens.screenHeight / 5,
          maxWidth: width ?? Dimens.screenWidth / 1.2,
        ),
        child: Container(
          margin: kDefaultPadding,
          padding: kDefaultPadding,
          child: Align(
            alignment: Alignment.center,
            child: Material(
              type: MaterialType.card,
              color: Theme.of(Get.context!).dialogBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.all(
                Radius.circular(Dimens.r15),
              ),
              child: child.paddingAll(Dimens.f12),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.lightPrimaryColor.withOpacity(0.2),
      name: 'simple_dialog',
    );
  }

  static void showError(String message) {
    closeSnackBar();
    closeDialog();
    closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: AppStyles.style14Bold.copyWith(color: AppColors.lightWhiteColor),
      ),
      snackPosition: SnackPosition.TOP,
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          AppString.okay,
          style: AppStyles.style14Bold.copyWith(color: AppColors.lightWhiteColor),
        ),
      ),
      backgroundColor: AppColors.lightErrorColor,
      margin: kDefaultPadding,
      borderRadius: Dimens.r15,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Show No Internet Dialog

  static void showNoInternetDialog(Function()? onRetry) {
    closeDialog();
    Get.dialog<void>(
      PopScope(
        onPopInvoked: (_) async => false,
        child: Scaffold(
          body: Padding(
            padding: Dimens.edgA16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.screenWidth * 0.75,
                  height: Dimens.screenWidth * 0.75,
                ),
                Dimens.boxHeight16,
                Text(
                  'No Internet!',
                  textAlign: TextAlign.center,
                  style: AppStyles.style24Bold.copyWith(
                    color: AppColors.lightErrorColor,
                  ),
                ),
                Dimens.boxHeight20,
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      name: 'no_internet_dialog',
    );
  }

  // Show BottomSheet
  static void showBottomSheet({
    required Widget child,
    double? borderRadius,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    bool? isScrollControlled,
    bool isDismissible = true,
  }) {
    closeBottomSheet();
    Get.bottomSheet(
      PopScope(
        canPop: true,
        child: Padding(
          padding: Dimens.edgA10,
          child: Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Ink(
                  height: 10,
                  width: 80,
                  decoration: AppDecoration.roundedBoxDecoration(Get.context!).copyWith(color: AppColors.lightGrayColor),
                ),
              ),
              Dimens.boxHeight16,
              child
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? kDefaultPaddingValue),
          topRight: Radius.circular(borderRadius ?? kDefaultPaddingValue),
        ),
      ),
      isScrollControlled: isScrollControlled ?? false,
      backgroundColor: Theme.of(Get.context!).bottomSheetTheme.modalBackgroundColor,
      elevation: 0.0,
      enterBottomSheetDuration: const Duration(milliseconds: 200),
      exitBottomSheetDuration: Duration.zero,
      useRootNavigator: true,
      isDismissible: isDismissible,
      enableDrag: false,
    );
  }

  //show general dialog
  static void showGeneralDialog({
    List<Widget> children = const <Widget>[],
    double? height,
    double? width,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    Get.generalDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: kDefaultPadding,
            decoration: BoxDecoration(
              color: AppColors.lightScafoldBgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? MediaQuery.of(context).size.height / 2.5,
            child: Material(
              color: AppColors.lightScafoldBgColor,
              child: Column(
                crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: child,
        );
      },
    );
  }

  /// Show SnackBar

  static void showSnackBar(String message, SnackType type, {int? duration}) {
    closeSnackBar();
    closeDialog();
    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.zero,
        overlayBlur: 0.2,
        borderRadius: 0,
        padding: Dimens.edgeV16H12,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        borderWidth: 0,
        messageText: Text(
          message.trimLeft().trim().toCapitalFirst,
          maxLines: 4,
          style: AppStyles.style13Bold.copyWith(
            color: renderTextColor(type),
          ),
        ),
        icon: Icon(
          renderIcon(type),
          color: renderIconColor(type),
          size: Dimens.f20,
        ),
        mainButton: Padding(
          padding: Dimens.edgeH8,
          child: AyushTextButton(
            onTap: closeSnackBar,
            label: AppString.ok.toUpperCase(),
            textColor: Colors.white,
          ),
        ),
        shouldIconPulse: false,
        backgroundColor: type == SnackType.error ? AppColors.lightErrorColor : Theme.of(Get.context!).snackBarTheme.backgroundColor!,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }

  /// Render Text Color
  static Color renderTextColor(SnackType type) {
    return Theme.of(Get.context!).snackBarTheme.contentTextStyle!.color!;
  }

  /// Render Icon Color
  static Color renderIconColor(SnackType type) {
    if (type == SnackType.success) {
      return AppColors.lightWhiteColor;
    }
    return Theme.of(Get.context!).snackBarTheme.contentTextStyle!.color!;
  }

  /// Render Icon
  static IconData renderIcon(SnackType type) {
    if (type == SnackType.success) {
      return CupertinoIcons.checkmark_alt_circle_fill;
    }

    return CupertinoIcons.info_circle_fill;
  }

  /// --------------------------------------------------------------------------

  static void printLog(message) {
    debugPrint("=======================================================================");
    debugPrint(message.toString(), wrapWidth: 1024);
    debugPrint("=======================================================================");
  }

  /// --------------------------------------------------------------------------

  /// Open Url
  static Future<void> openUrl(String url) async {
    try {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        showError("Couldn't launch url");
      }
    } catch (e) {
      showError("Couldn't launch url");
    }
  }

  /// Random String
  static String generateUid(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@!%&_';
    var rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        16,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  static bool isNetwork(String url) {
    if (url.contains("https") || url.contains("http")) return true;
    return false;
  }
}
