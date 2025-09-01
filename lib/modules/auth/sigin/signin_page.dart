import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/assets/icon_assets.dart';
import 'package:healthbuxus/constants/app_string.dart';
import 'package:healthbuxus/extensions/text_theme_extension.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/modules/auth/controllers/sign_in_controller.dart';
import 'package:healthbuxus/modules/auth/sigin/components/sigin_header.dart';
import 'package:healthbuxus/modules/auth/signup/components/auth_header.dart';
import 'package:healthbuxus/routes/route_management.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';
import 'package:healthbuxus/widgets/common/ayush_filled_btn.dart';
import 'package:healthbuxus/widgets/common/ripple_effect.dart';
import 'package:healthbuxus/widgets/custom/custom_phone_filed.dart';
import 'package:healthbuxus/widgets/custom/custom_textfield.dart';
import 'package:pinput/pinput.dart';
import '../signup/components/signup_bottom_section.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).whiteColor,
      body: GetBuilder<SiginController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: SizedBox(
              height: Dimens.screenHeight,
              width: Dimens.screenWidth,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  const TopSectionForSiginPage(),
                  Positioned(
                    top: Dimens.screenHeight * 0.25,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        //header part
                        AuthHeaderWithTabITem(
                          onMobileTap: (val) => controller.onItemTap(val),
                          onEmailTap: (val) => controller.onItemTap(val),
                          headerText: "Sign In with",
                          isEmailSelectd: controller.isEmailSelectd,
                          isMobileSelected: controller.isMobileSelected,
                        ),
                        //center part
                        if (controller.isOtpSent == false)
                          Container(
                            padding: kDefaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.selectedItemValue == 0)
                                  CustomPhoneField(
                                    hintText: "Phone No",
                                    labelText: "Phone No",
                                    prefixSvgIcon: IconAssets.person,
                                    selectedCountryModel: controller.selectedCountryModel,
                                    onSelect: (SelectedCountryModel model) => controller.onSelectContryTap(model),
                                  ),
                                if (controller.selectedItemValue == 1)
                                  const CustomTextFiled(
                                    hintText: "Email",
                                    labelText: "Email",
                                    keyboardType: TextInputType.emailAddress,
                                    prefixSvgIcon: IconAssets.email,
                                  ),
                                Dimens.boxHeight40,
                                AyusFilledButton(
                                  padding: kDefaultPadding.copyWith(top: 0, bottom: 0),
                                  label: "Send OTP",
                                  width: Dimens.screenWidth,
                                  fontSize: Dimens.f14,
                                  onTap: () => controller.sendOTPTap(),
                                  suffix: SvgPicture.asset(IconAssets.send),
                                ),
                              ],
                            ),
                          ),
                        //OTP part
                        OTPContainer(
                          isVisible: controller.isOtpSent == true,
                          onVerifyTap: controller.verifyOTPTap,
                          onResendOTPTap: controller.onResendOTPTap,
                        ),
                      ],
                    ),
                  ),
                  //bottom part
                  SignUpBottomSection(
                    text: AppString.donthaveAnAccount.tr,
                    secondText: AppString.signUp,
                    onTap: () => RouteManagement.goToSignUpPage(),
                    topChild: Column(
                      children: [
                        Text(
                          AppString.orContinueTap,
                          style: AppStyles.style14Normal.copyWith(
                            color: Theme.of(context).bodySmallColor,
                          ),
                        ),
                        Dimens.boxHeight40,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialIconBtn(
                              svgIcon: IconAssets.google,
                              onTap: controller.onGoogleTap,
                            ),
                            SocialIconBtn(
                              svgIcon: IconAssets.facebook,
                              onTap: controller.onfaceBookTap,
                            ),
                            SocialIconBtn(
                              svgIcon: IconAssets.apple,
                              onTap: controller.onAppleTap,
                            ),
                          ],
                        ),
                        Dimens.boxHeight40,
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OTPContainer extends StatelessWidget {
  const OTPContainer({
    super.key,
    this.onVerifyTap,
    this.onResendOTPTap,
    this.isVisible = false,
  });

  final VoidCallback? onVerifyTap;
  final VoidCallback? onResendOTPTap;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              "Enter your OTP code here ",
              style: AppStyles.style14Normal.copyWith(color: Theme.of(context).bodyMediumColor),
            ),
            Dimens.boxHeight20,
            //piput
            Pinput(
              length: 6,
              defaultPinTheme: AppStyles.defaultPinTheme(context),
              followingPinTheme: AppStyles.focusedPinTheme(context),
              submittedPinTheme: AppStyles.submittedPinTheme(context),
              separatorBuilder: (index) => Dimens.boxWidth20,
            ),
            Dimens.boxHeight20,
            RichText(
              text: TextSpan(
                text: "Don't receive OTP code?",
                style: AppStyles.style14Normal.copyWith(color: Theme.of(context).bodyMediumColor),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = onResendOTPTap,
                    text: " Resend OTP",
                    style: AppStyles.style14Normal.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),

            Dimens.boxHeight20,

            AyusFilledButton(
              padding: kDefaultPadding.copyWith(top: 0, bottom: 0),
              label: "Verify to Sign In",
              width: Dimens.screenWidth,
              fontSize: Dimens.f14,
              onTap: onVerifyTap,
              suffix: SvgPicture.asset(IconAssets.send),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIconBtn extends StatelessWidget {
  const SocialIconBtn({
    super.key,
    required this.svgIcon,
    required this.onTap,
  });
  final String svgIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RippleEffect(
      onTap: onTap,
      child: Ink(
        height: Dimens.h20 * 2.25,
        width: Dimens.w20 * 3,
        padding: EdgeInsets.symmetric(horizontal: Dimens.h8, vertical: Dimens.w10),
        decoration: BoxDecoration(
          color: AppColors.lightSocialBackgroundColor,
          borderRadius: Dimens.circularBorderRadius,
        ),
        child: SvgPicture.asset(svgIcon),
      ),
    );
  }
}
