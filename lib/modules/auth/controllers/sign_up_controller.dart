import 'package:get/get.dart';
import 'package:healthbuxus/routes/route_management.dart';
import 'package:healthbuxus/widgets/custom/custom_phone_filed.dart';

class SignUpontroller extends GetxController {
  int selectedItemValue = 0;
  SelectedCountryModel? selectedCountryModel;
  bool isOtpSent = false;

//gettrs
  get isMobileSelected => selectedItemValue == 0;
  get isEmailSelectd => selectedItemValue == 1;

  void onItemTap(int val) {
    selectedItemValue = val;
    update();
  }

  void sendOTPTap() async {
    isOtpSent = true;
    update();
  }

  void onSelectContryTap(SelectedCountryModel model) => selectedCountryModel = model;

  void onResendOTPTap() {}

  void onVerifyOTPTap() {
    isOtpSent = false;
    update();
    RouteManagement.goToApplicationPage();
  }
}
