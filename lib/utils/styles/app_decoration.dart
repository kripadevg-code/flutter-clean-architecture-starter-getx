import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/utils/app_colors.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

abstract class AppDecoration {
  static BoxDecoration roundedBoxDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(width: 1, color: AppColors.lightGreyColorShade),
        borderRadius: BorderRadius.circular(Dimens.r10),
      );

  static BoxDecoration boxDecorationNoRadius(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(0),
      border: context.isDarkMode ? Border.all(width: 0) : null,
    );
  }

  //tectfield input Decoration
  static InputDecoration textfieldDecoration(
    BuildContext context, {
    String? hintText,
    String? labelText,
    String? errorText,
  }) {
    return InputDecoration(
      errorText: errorText,
      hintText: hintText,
      labelText: labelText,
      errorMaxLines: 2,
      contentPadding: EdgeInsets.only(bottom: 0, top: 0, left: Dimens.w10, right: Dimens.w10),
      hintStyle: AppStyles.textfieldHintTextStyel,
      labelStyle: AppStyles.textfieldLabelTextStyle(context),
      border: border(context, false),
      enabledBorder: border(context, false),
      focusedBorder: border(context, true),
    );
  }

  //textfield border
  static OutlineInputBorder border(
    BuildContext context,
    bool isEnabled,
  ) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: isEnabled ? 1.5 : 1,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
