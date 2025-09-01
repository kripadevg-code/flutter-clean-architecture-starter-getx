import 'package:flutter/material.dart';
import 'package:healthbuxus/utils/dimens.dart';

class RippleEffect extends StatelessWidget {
  const RippleEffect({super.key, this.onTap, required this.child, this.radius});

  final VoidCallback? onTap;
  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: Dimens.circularBorderRadius,
      child: InkWell(
        splashColor: Colors.black87.withOpacity(0.4),
        borderRadius: radius == null ? Dimens.circularBorderRadius : BorderRadius.circular(radius!),
        onTap: onTap,
        child: Ink(child: child),
      ),
    );
  }
}
