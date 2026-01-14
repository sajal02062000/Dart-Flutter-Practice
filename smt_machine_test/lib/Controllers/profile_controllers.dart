import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

import '../Helpers/local_storage_helpers.dart';

class ProfileControllers extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final roleController = TextEditingController();
  final scoreController = TextEditingController();

  void getCreds() {
    emailController.text = LocalStorageHelper.getEmail();
    nameController.text = "CrickBro Player";
    phoneController.text = "9109824356";
    roleController.text = "Right Hand Batter";
    scoreController.text = "90";
  }

  @override
  void onInit() {
    super.onInit();
    getCreds();
  }
}
