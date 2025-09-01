import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthbuxus/extensions/text_theme_extension.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

class SignUpBottomSection extends StatelessWidget {
  const SignUpBottomSection({super.key, this.text, this.onTap, this.secondText, this.topChild});

  final Widget? topChild;
  final String? text;
  final String? secondText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          if (topChild != null) topChild!,
          RichText(
            text: TextSpan(
              style: AppStyles.style14Normal.copyWith(
                color: Theme.of(context).bodySmallColor,
              ),
              children: [
                TextSpan(text: text),
                TextSpan(
                  text: secondText,
                  recognizer: TapGestureRecognizer()..onTap = onTap,
                  style: AppStyles.style14Normal.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/icons/auth/sign_in_bottom.svg",
            width: Dimens.screenWidth,
          ),
        ],
      ),
    );
  }
}
