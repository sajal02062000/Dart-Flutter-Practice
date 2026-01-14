import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_machine_test/Helpers/local_storage_helpers.dart';
import 'package:smt_machine_test/Screens/home_screen.dart';
import 'package:smt_machine_test/Screens/login_screen.dart';

import '../Constants/assets.dart';
import '../Widgets/custom_gradient_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      final bool isLogin = LocalStorageHelper.getLoggedin();
      if (isLogin) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomGradientBackground(
        child: Center(child: Image.asset(Assets.logo, height: 100)),
      ),
    );
  }
}
