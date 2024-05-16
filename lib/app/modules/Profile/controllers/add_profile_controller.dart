import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_tel_u_clone/app/modules/Profile/controllers/profile_controller.dart';

class AddProfileController extends GetxController {
  late TextEditingController name;
  late TextEditingController location;

  @override
  void onInit() {
    super.onInit();
    name =
        TextEditingController(text: Get.find<ProfileController>().name.value);
    location = TextEditingController(
      text: Get.find<ProfileController>().location.value,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
