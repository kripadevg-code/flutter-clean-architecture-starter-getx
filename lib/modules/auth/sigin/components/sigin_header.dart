import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/assets/icon_assets.dart';
import 'package:healthbuxus/assets/image_assets.dart';
import 'package:healthbuxus/constants/app_string.dart';
import 'package:healthbuxus/extensions/text_theme_extension.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

class TopSectionForSiginPage extends StatelessWidget {
  const TopSectionForSiginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            IconAssets.siginTopBackground,
            width: Dimens.screenWidth,
          ),
        ),
        Positioned(
          top: Dimens.h20 * 1.7,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Dimens.boxHeight30,
              SvgPicture.asset(
                ImageAssets.ligthAppLogo,
                width: Dimens.w20 * 3.5,
                height: Dimens.h20 * 3.5,
              ),
              Dimens.boxHeight20,
              RichText(
                text: TextSpan(
                  text: AppString.welcomeTo.tr,
                  style: AppStyles.style16Bold.copyWith(
                    color: Theme.of(context).bodyMediumColor,
                  ),
                  children: [
                    TextSpan(
                      text: AppString.health,
                      style: AppStyles.style16Black.copyWith(
                        color: Theme.of(context).bodyMediumColor,
                      ),
                    ),
                    TextSpan(
                      text: AppString.buxus,
                      style: AppStyles.style16Black.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
