import 'package:get/get.dart';
import 'app_pages.dart';

abstract class RouteManagement {
  static void goToSplashPage() => Get.offAllNamed(AppRoutes.initialPage);
  static void goToWelcomePage() => Get.offAllNamed(AppRoutes.welcomePage);
  static void goToIntroPage() => Get.offAllNamed(AppRoutes.introPage);

  static void goToSignInPage() => Get.toNamed(AppRoutes.signInPage);
  static void goToSignUpPage() => Get.toNamed(AppRoutes.signUpPage);

  static void goToLoginWithPhonePage() => Get.toNamed(AppRoutes.loginWithPhonePage);

  static void goToOTPVerificationPage() => Get.toNamed(AppRoutes.otpVerificationPage);

  static void goToApplicationPage({int? setIndex}) {
    Get.offAllNamed(AppRoutes.applicationPage, arguments: setIndex);
  }

  static void goToBack() => Get.back();

  static goToProfilePage() => Get.toNamed(AppRoutes.profilePage);

  static goToForgotPasswordPage() {
    return Get.toNamed(AppRoutes.forgotPasswordPage);
  }
}
