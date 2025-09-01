import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/dependencies/app_dependencies.dart';
import 'package:healthbuxus/routes/app_pages.dart';
import 'package:healthbuxus/themes/app_theme_controller.dart';
import 'package:healthbuxus/utils/utility.dart';
import 'package:healthbuxus/widgets/core/restart.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/hive_box_names.dart';
import 'global/k_theme_config.dart';
import 'services/pre_app_services/hive_services.dart';
import 'services/pre_app_services/network_service.dart';
import 'translation/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPreAppServices();
  runApplication();
  await _initPostAppServices();
}

void runApplication() {
  AppUtility.log('Initializing App');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const HealthBuxusApp());
  AppUtility.log('App Initialized');
}

Future<void> _initPreAppServices() async {
  AppUtility.log('Initializing PreApp Services');
  //networks
  final networkService = NetworkService.instance;
  await networkService.initialize();
  //storage
  await HiveService.initHiveServices();
  await Hive.openBox<String>(HiveBoxNames.themeMode);

  //dependencies
  await AppDependencies.initializeDependencies();
}

Future<void> _initPostAppServices() async {
  // final networkService = NetworkController.instance;
}

class HealthBuxusApp extends StatelessWidget {
  const HealthBuxusApp({super.key});

  ThemeMode _handleAppTheme(String? mode) {
    if (mode == kDarkMode) {
      return ThemeMode.dark;
    }
    if (mode == kLightMode) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return Restart(
      child: GetBuilder<AppThemeController>(
        builder: (controller) {
          return ScreenUtilInit(
            designSize: const Size(411.4, 867.4),
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                title: 'Flutter Startup Template',
                debugShowCheckedModeBanner: false,
                themeMode: _handleAppTheme(controller.themeMode),
                theme: controller.getLightThemeData(context),
                darkTheme: controller.getDarkThemeData(context),
                translations: AppTranslations(),
                initialRoute: AppRoutes.initialPage,
                getPages: AppPages.pages,
                locale: const Locale('en', 'US'),
              );
            },
          );
        },
      ),
    );
  }
}
