import 'package:flutter/material.dart';
import 'package:healthbuxus/utils/styles/app_text_style.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Application Page...',
                style: AppStyles.style16Bold.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
