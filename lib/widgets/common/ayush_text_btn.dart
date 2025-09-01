import 'package:flutter/material.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

class AyushTextButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;
  final bool? enabled;
  final Color? textColor;
  final double? borderRadius;
  final double? size;
  final bool isCircle;

  const AyushTextButton({
    Key? key,
    this.label,
    this.onTap,
    this.padding,
    this.margin,
    this.labelStyle,
    this.enabled = true,
    this.textColor,
    this.borderRadius,
    this.size,
    this.isCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        onPressed: enabled == true ? onTap : null,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: isCircle ? null : rectangleShape,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        child: label != null
            ? Text(
                label!,
                style: AppStyles.style14Bold
                    .copyWith(
                      color: (enabled == false) ? Theme.of(context).disabledColor : textColor ?? Theme.of(context).primaryColor,
                      fontSize: size,
                    )
                    .merge(labelStyle),
              )
            : const SizedBox(),
      ),
    );
  }

  RoundedRectangleBorder get rectangleShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? kDefaultPaddingValue),
    );
  }
}
