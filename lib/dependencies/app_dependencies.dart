import 'package:get/get.dart';
import 'package:healthbuxus/themes/app_theme_controller.dart';

abstract class AppDependencies {
  static Future<void> initializeDependencies() async {
    Get.lazyPut(() => AppThemeController(), fenix: true);
  }
}
