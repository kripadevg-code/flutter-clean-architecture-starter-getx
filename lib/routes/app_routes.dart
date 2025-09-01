part of 'app_pages.dart';

abstract class AppRoutes {
  static const initialPage = _Routes.initial;
  static const welcomePage = _Routes.welcome;
  static const introPage = _Routes.intro;
  static const applicationPage = _Routes.application;

  //user
  static const signInPage = _Routes.signin;
  static const signUpPage = _Routes.signUp;

  static const forgotPasswordPage = _Routes.forgotPassword;
  static const loginWithPhonePage = _Routes.loginWithPhone;
  static const otpVerificationPage = _Routes.otpVerification;
  static const profilePage = _Routes.profile;
}

abstract class _Routes {
  static const initial = '/';
  static const welcome = "/welcome";
  static const intro = "/intro_page";
  static const application = "/application_page";

  //User
  static const signin = '/signin_page';
  static const signUp = "/sign_up";

  static const forgotPassword = "/forgot_password_page";
  static const loginWithPhone = "/login_with_phone_page";
  static const otpVerification = "/otp_verification_page";
  static const profile = "/profile_page";
}
