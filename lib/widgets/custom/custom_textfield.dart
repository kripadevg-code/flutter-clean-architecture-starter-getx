import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthbuxus/utils/dimens.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixSvgIcon,
    this.isBottomSpace = false,
    this.keyboardType,
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? prefixSvgIcon;
  final bool isBottomSpace;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixSvgIcon != null ? _buildPrefix() : null,
          ),
        ),
        if (isBottomSpace) Dimens.boxHeight16,
      ],
    );
  }

  Widget _buildPrefix() {
    return Padding(
      padding: Dimens.edgA10.copyWith(right: Dimens.w3),
      child: SvgPicture.asset(
        prefixSvgIcon!,
        height: Dimens.h20,
        width: Dimens.w20,
      ),
    );
  }
}
