import 'package:flutter/material.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

class AyusFilledButton extends StatelessWidget {
  const AyusFilledButton({
    Key? key,
    this.label,
    this.bgColor,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.labelColor,
    this.onTap,
    this.padding,
    this.margin,
    this.fontSize,
    this.width,
    this.height,
    this.labelStyle,
    this.enabled = true,
    this.size,
    this.child,
    this.isCircle = false,
    this.borderWidth,
    this.elevation = 4,
  }) : super(key: key);

  final Color? bgColor;
  final double? borderRadius;
  final String? label;
  final Color? labelColor;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;
  final bool enabled;
  final double? size;
  final Widget? child;
  final bool isCircle;
  final double? borderWidth;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height ?? Dimens.h20 * 2.25,
      child: ElevatedButton(
        onPressed: enabled == true ? onTap : null,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: isCircle ? null : rectangleShape,
          backgroundColor: bgColor ?? Theme.of(context).primaryColor,
          disabledBackgroundColor: Theme.of(context).primaryColorLight,
          side: borderWidth == null
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth!,
                  color: AppColors.lightGrayColor,
                  style: BorderStyle.solid,
                ),
          elevation: elevation,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        child: child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) Dimens.boxWidth4,
                if (label != null)
                  Text(
                    label!,
                    style: AppStyles.style16Bold
                        .copyWith(
                          color: enabled == true ? labelColor ?? Theme.of(context).textTheme.titleLarge!.color : Theme.of(context).canvasColor,
                        )
                        .merge(labelStyle)
                        .copyWith(fontSize: fontSize),
                  ),
                if (suffix != null) Dimens.boxWidth4,
                if (suffix != null) suffix!,
              ],
            ),
      ),
    );
  }

  RoundedRectangleBorder get rectangleShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? Dimens.r5),
    );
  }
}
