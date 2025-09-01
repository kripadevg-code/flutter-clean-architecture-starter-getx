import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';
import 'package:healthbuxus/widgets/common/ripple_effect.dart';

class AuthTabItem extends StatelessWidget {
  const AuthTabItem({
    super.key,
    this.label,
    this.icon,
    this.isSelected = false,
    this.onTap,
    required this.value,
  });

  final String? label;
  final String? icon;
  final bool isSelected;
  final int value;
  final void Function(int val)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RippleEffect(
      onTap: handleOnTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColorLight : null,
          borderRadius: BorderRadius.circular(Dimens.r4),
          border: isSelected ? Border.all(width: 0.7, color: theme.primaryColor) : null,
        ),
        padding: EdgeInsets.only(left: Dimens.w16, right: Dimens.w16, top: Dimens.h8, bottom: Dimens.h8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  icon!,
                  color: isSelected ? theme.primaryColor : AppColors.lightDisabledColor,
                ),
              ),
            if (isSelected) Dimens.boxWidth10,
            if (isSelected)
              Expanded(
                flex: 2,
                child: Text(
                  label ?? '',
                  style: AppStyles.style16Bold.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void handleOnTap() {
    if (onTap != null) {
      onTap!(value);
    }
  }
}
