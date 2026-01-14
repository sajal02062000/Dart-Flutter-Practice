import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Helpers/local_storage_helpers.dart';
import '../Screens/home_screen.dart';
import '../Screens/login_screen.dart';
import '../Utils/show_toaster_message.dart';

class LoginControllers extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login({required BuildContext context}) {
    // email: test@example.com, password: 123456
    if (emailController.text.isEmpty) {
      showToasterMessage(
        context: context,
        message: "Email is required",
        type: ToasterMessageType.error,
      );
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      showToasterMessage(
        context: context,
        message: "Enter a valid email address",
        type: ToasterMessageType.error,
      );
      return;
    }
    if (passwordController.text.isEmpty) {
      showToasterMessage(
        context: context,
        message: "Password is required",
        type: ToasterMessageType.error,
      );
      return;
    }
    if (passwordController.text.length < 6) {
      showToasterMessage(
        context: context,
        message: "Password must be at least 6 characters",
        type: ToasterMessageType.error,
      );
      return;
    }

    if (emailController.text == "test@example.com" &&
        passwordController.text == "123456") {
      LocalStorageHelper.storeToken(
        isLoggedin: true,
        email: emailController.text,
      );
      Get.offAll(() => HomeScreen());
      showToasterMessage(
        context: context,
        message: "Login successful",
        type: ToasterMessageType.success,
      );
    } else {
      showToasterMessage(
        context: context,
        message: "Invalid email or password",
        type: ToasterMessageType.error,
      );
    }
  }

  void logout() {
    LocalStorageHelper.storeToken(isLoggedin: false, email: "");
    Get.offAll(() => LoginScreen());
  }
}
