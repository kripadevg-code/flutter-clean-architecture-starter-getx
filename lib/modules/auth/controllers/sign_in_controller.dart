import 'package:get/get.dart';
import 'package:healthbuxus/routes/route_management.dart';
import 'package:healthbuxus/widgets/custom/custom_phone_filed.dart';

class SiginController extends GetxController {
  //variables
  int selectedItemValue = 0;
  SelectedCountryModel? selectedCountryModel;
  bool isOtpSent = false;

  //getters
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

  void onResendOTPTap() async {}

  void verifyOTPTap() {
    isOtpSent = false;
    update();
    RouteManagement.goToApplicationPage();
  }

  void onGoogleTap() {}

  void onfaceBookTap() {}

  void onAppleTap() {}
}
