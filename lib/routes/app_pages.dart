import 'package:get/get.dart';
import 'package:healthbuxus/modules/application/application_page.dart';
import 'package:healthbuxus/modules/auth/bindings/forgot_pass_binding.dart';
import 'package:healthbuxus/modules/auth/bindings/sign_up_binding.dart';
import 'package:healthbuxus/modules/auth/bindings/signin_binding.dart';
import 'package:healthbuxus/modules/auth/bindings/login_with_phone_binding.dart';
import 'package:healthbuxus/modules/auth/bindings/otp_verification_binding.dart';
import 'package:healthbuxus/modules/auth/forgot_password/forgot_password_page.dart';
import 'package:healthbuxus/modules/auth/sigin/signin_page.dart';
import 'package:healthbuxus/modules/auth/login_with_phone/login_with_phone_page.dart';
import 'package:healthbuxus/modules/auth/otp/otp_verification_page.dart';
import 'package:healthbuxus/modules/auth/signup/signup_page.dart';
import 'package:healthbuxus/modules/intro/intro_page.dart';
import 'package:healthbuxus/modules/splash/bindings/initial_binding.dart';
import 'package:healthbuxus/modules/splash/splash_page.dart';
import 'package:healthbuxus/modules/welcome/welcome_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const defaultTransition = Transition.rightToLeft;
  static final List<GetPage> pages = [
    //
    GetPage(
      name: AppRoutes.initialPage,
      page: SplashPage.new,
      binding: InitialBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.introPage,
      page: IntroPage.new,
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.welcomePage,
      binding: InitialBinding(),
      page: WelcomePage.new,
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.applicationPage,
      page: ApplicationPage.new,
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.signInPage,
      page: SignInPage.new,
      binding: SignInBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.signUpPage,
      page: SignUpPage.new,
      binding: SignIUpBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.forgotPasswordPage,
      page: ForgotPasswordPage.new,
      binding: ForgotPasswordBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.loginWithPhonePage,
      page: LoginWithPhonePage.new,
      binding: LoginWithPhoneBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.otpVerificationPage,
      page: OTPVerificationPage.new,
      binding: OTPVerficationBinding(),
      transition: defaultTransition,
    ),
  ];
}
