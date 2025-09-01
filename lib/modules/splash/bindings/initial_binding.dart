import 'package:get/get.dart';
import 'package:healthbuxus/modules/splash/controller/initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController(), fenix: true);
  }
}
