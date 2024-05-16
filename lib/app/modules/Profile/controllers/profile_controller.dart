import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = "Kemal Crisannaufal".obs;
  var location = "Bandung, Jawa Barat".obs;
  var gender = "Laki-laki".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void editProfile(String name, String location) {
    this.name.value = name;
    this.location.value = location;
  }
}
