import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/assets/image_assets.dart';
import 'package:healthbuxus/modules/splash/controller/initial_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InitialController>(
        builder: (_) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Image.asset(
                  ImageAssets.appLaunch,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
