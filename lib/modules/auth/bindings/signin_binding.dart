import 'package:get/get.dart';
import 'package:healthbuxus/modules/auth/controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SiginController(), fenix: true);
  }
}
