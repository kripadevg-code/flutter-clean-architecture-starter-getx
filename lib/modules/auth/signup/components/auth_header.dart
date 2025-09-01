import 'package:flutter/material.dart';
import 'package:healthbuxus/assets/icon_assets.dart';
import 'package:healthbuxus/extensions/text_theme_extension.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/modules/auth/sigin/components/auth_tab_item.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

class AuthHeaderWithTabITem extends StatelessWidget {
  const AuthHeaderWithTabITem({
    super.key,
    this.headerText,
    this.isMobileSelected = false,
    this.isEmailSelectd = false,
    this.onMobileTap,
    required this.onEmailTap,
  });

  final String? headerText;
  final bool isMobileSelected;
  final bool isEmailSelectd;
  final Function(int val)? onMobileTap;
  final Function(int val)? onEmailTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            headerText ?? '',
            style: AppStyles.style24Bold.copyWith(
              color: Theme.of(context).bodyMediumColor,
            ),
          ),
          Dimens.boxWidth10,
          Expanded(
            flex: isMobileSelected ? 2 : 1,
            child: AuthTabItem(
              label: "Mobile",
              value: 0,
              isSelected: isMobileSelected,
              icon: IconAssets.personWithPhone,
              onTap: onMobileTap,
            ),
          ),
          Expanded(
            flex: isEmailSelectd ? 2 : 1,
            child: AuthTabItem(
              value: 1,
              label: "Email",
              icon: IconAssets.personWithEmail,
              isSelected: isEmailSelectd,
              onTap: onEmailTap,
            ),
          ),
        ],
      ),
    );
  }
}
