import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthbuxus/extensions/text_theme_extension.dart';
import 'package:healthbuxus/global/k_size.dart';
import 'package:healthbuxus/utils/dimens.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';
import 'package:healthbuxus/widgets/common/ripple_effect.dart';

class SelectedCountryModel {
  String selectedPhoneCode;
  String selectedContryCode;
  String selectedCuntryFlag;

  SelectedCountryModel({
    this.selectedPhoneCode = "+91",
    this.selectedContryCode = "IN",
    this.selectedCuntryFlag = "🇮🇳",
  });

  @override
  String toString() {
    return """\n
        selectedPhoneCode = "$selectedPhoneCode"\n
        selectedContryCode = "$selectedContryCode"\n
        selectedCuntryFlag = "$selectedCuntryFlag"\n
        """;
  }
}

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixSvgIcon,
    this.isBottomSpace = false,
    required this.onSelect,
    this.selectedCountryModel,
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? prefixSvgIcon;
  final bool isBottomSpace;
  final SelectedCountryModel? selectedCountryModel;
  final void Function(SelectedCountryModel model) onSelect;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  var model = SelectedCountryModel();
  @override
  void initState() {
    if (widget.selectedCountryModel != null) {
      model = widget.selectedCountryModel!;
    }
    widget.onSelect(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(10)],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: Dimens.w8),
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: getPrefix(context),
          ),
        ),
        if (widget.isBottomSpace) Dimens.boxHeight16,
      ],
    );
  }

  Widget getPrefix(BuildContext context) {
    return RippleEffect(
      onTap: () => showCountryPicker(
        context: context,
        showPhoneCode: true,
        countryListTheme: CountryListThemeData(
          flagSize: Dimens.h20 * 1.25,
          bottomSheetHeight: Dimens.screenHeight / 1.4,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.r14),
            topRight: Radius.circular(Dimens.r14),
          ),
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            contentPadding: kDefaultPadding,
            isDense: true,
          ),
        ),
        onSelect: onSelect,
      ),
      child: Container(
        width: model.selectedCuntryFlag.isEmpty ? Dimens.w20 * 2 : Dimens.w14 * 5,
        margin: Dimens.onlyLeft4,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(model.selectedCuntryFlag),
              Dimens.boxWidth8,
              Text(
                model.selectedPhoneCode,
                style: AppStyles.style15Bold.copyWith(color: Theme.of(context).bodyMediumColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSelect(Country country) {
    setState(() {
      model = SelectedCountryModel(
        selectedContryCode: country.countryCode,
        selectedPhoneCode: "+${country.phoneCode}",
        selectedCuntryFlag: country.flagEmoji,
      );
      widget.onSelect(model);
    });
  }
}
