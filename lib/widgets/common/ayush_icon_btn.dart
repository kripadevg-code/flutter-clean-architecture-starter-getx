import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';

class AyushIconButton extends StatelessWidget {
  final IconData? icon;
  final String? svgIcon;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? iconSize;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? disabledColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? size;
  final Widget? child;
  final bool isCircle;
  final bool isEnabled;
  final double? borderWidth;
  final double? scale;
  final Offset? offset;

  const AyushIconButton({
    Key? key,
    this.icon,
    this.onTap,
    this.iconColor,
    this.bgColor,
    this.padding,
    this.iconSize,
    this.borderRadius,
    this.child,
    this.size,
    this.isCircle = false,
    this.isEnabled = true,
    this.disabledColor,
    this.borderWidth,
    this.scale,
    this.svgIcon,
    this.height,
    this.width,
    this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scale != null
        ? Transform.scale(
            alignment: Alignment.center,
            scale: scale,
            origin: offset,
            child: buildbtn(context),
          )
        : buildbtn(context);
  }

  IconButton buildbtn(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: onTap,
      padding: padding,
      iconSize: iconSize ?? Dimens.f20 * 1.2,
      style: IconButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: bgColor,
        shape: isCircle ? null : rectangleShape,
        maximumSize: size != null ? Size.square(size!) : null,
        minimumSize: size != null ? Size.square(size!) : null,
        disabledBackgroundColor: isEnabled == false ? disabledColor : null,
      ),
      icon: svgIcon != null
          ? SvgPicture.asset(
              svgIcon!,
              height: height,
              width: width,
            )
          : child ??
              Icon(
                icon,
                color: iconColor ?? Theme.of(context).iconTheme.color,
              ),
    );
  }

  RoundedRectangleBorder get rectangleShape {
    return RoundedRectangleBorder(
      side: borderWidth == null
          ? BorderSide.none
          : BorderSide(
              width: borderWidth!,
              color: AppColors.lightGrayColor,
              style: BorderStyle.solid,
            ),
      borderRadius: BorderRadius.circular(borderRadius ?? kDefaultPaddingValue),
    );
  }
}
