import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/assets/icon_assets.dart';
import 'package:healthbuxus/constants/app_string.dart';
import 'package:healthbuxus/extensions/text_theme_extension.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/modules/auth/controllers/sign_up_controller.dart';
import 'package:healthbuxus/modules/auth/sigin/components/sigin_header.dart';
import 'package:healthbuxus/modules/auth/sigin/signin_page.dart';
import 'package:healthbuxus/modules/auth/signup/components/auth_header.dart';
import 'package:healthbuxus/routes/route_management.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';
import 'package:healthbuxus/widgets/common/ayush_filled_btn.dart';
import 'package:healthbuxus/widgets/custom/custom_phone_filed.dart';
import 'package:healthbuxus/widgets/custom/custom_textfield.dart';
import '../signup/components/signup_bottom_section.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).whiteColor,
      body: GetBuilder<SignUpontroller>(
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
                        AuthHeaderWithTabITem(
                          onMobileTap: (val) => controller.onItemTap(val),
                          onEmailTap: (val) => controller.onItemTap(val),
                          headerText: AppString.signUpWith.tr,
                          isEmailSelectd: controller.isEmailSelectd,
                          isMobileSelected: controller.isMobileSelected,
                        ),
                        if (controller.isOtpSent == false)
                          Container(
                            padding: kDefaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextFiled(
                                  hintText: AppString.userName.tr,
                                  labelText: AppString.userName.tr,
                                  prefixSvgIcon: IconAssets.person,
                                  isBottomSpace: true,
                                  keyboardType: TextInputType.name,
                                ),
                                if (controller.selectedItemValue == 0)
                                  CustomPhoneField(
                                    hintText: AppString.phoneNumber.tr,
                                    labelText: AppString.phoneNumber.tr,
                                    prefixSvgIcon: IconAssets.person,
                                    selectedCountryModel: controller.selectedCountryModel,
                                    onSelect: (SelectedCountryModel model) => controller.onSelectContryTap(model),
                                  ),
                                if (controller.selectedItemValue == 1)
                                  CustomTextFiled(
                                    hintText: AppString.email.tr,
                                    labelText: AppString.email.tr,
                                    keyboardType: TextInputType.emailAddress,
                                    prefixSvgIcon: IconAssets.email,
                                  ),
                                Dimens.boxHeight10,
                                Row(
                                  children: [
                                    SvgPicture.asset(IconAssets.location),
                                    Dimens.boxWidth10,
                                    Text(
                                      AppString.bangloreKarnataka.tr,
                                      style: AppStyles.style14Normal.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                Dimens.boxHeight20,
                                AyusFilledButton(
                                  padding: kDefaultPadding.copyWith(top: 0, bottom: 0),
                                  label: AppString.sendOTP.tr,
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
                          onVerifyTap: controller.onVerifyOTPTap,
                          onResendOTPTap: controller.onResendOTPTap,
                        ),
                      ],
                    ),
                  ),
                  SignUpBottomSection(
                    text: AppString.alreadyhaveAnAccount.tr,
                    secondText: AppString.signIn.tr,
                    onTap: () => RouteManagement.goToSignInPage(),
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
