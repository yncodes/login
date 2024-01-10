import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../splash_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.white),
            backgroundColor: Colors.white,
            body: Center(
              child: Image.asset(
                'assets/images/welcome.gif',
                width: double.infinity,
                height: 300,
              ),
            ),
          );
        });
  }
}
