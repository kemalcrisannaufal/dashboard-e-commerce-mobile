import 'package:get/get.dart';

import 'package:my_tel_u_clone/app/modules/Profile/controllers/add_profile_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProfileController>(
      () => AddProfileController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
