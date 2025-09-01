import 'package:get/get.dart';
import 'package:healthbuxus/modules/auth/controllers/sign_up_controller.dart';

class SignIUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpontroller(), fenix: true);
  }
}
