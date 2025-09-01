import 'dart:io';

import 'package:get/get.dart';
import 'package:healthbuxus/routes/route_management.dart';

class InitialController extends GetxController {
  final duration = const Duration(seconds: 3);
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    Future.delayed(duration, () async {
      if (Platform.isIOS) {
        _checkUpdateForIosApp();
      }
      if (Platform.isAndroid) {
        _checkUpdateForAndroidApp();
      }
    });
  }
}

void _checkUpdateForIosApp() async {}

void _checkUpdateForAndroidApp() async {
  checkForUserToken();
}

void checkForUserToken() async {
  RouteManagement.goToSignUpPage();
  // RouteManagement.goToSignInPage();
}
