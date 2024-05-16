import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_tel_u_clone/app/modules/Profile/controllers/add_profile_controller.dart';
import 'package:my_tel_u_clone/app/routes/app_pages.dart';
import 'package:my_tel_u_clone/app/shared/widgets/appbar.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final addProfileC = Get.put(AddProfileController());
    return Scaffold(
      appBar:
          CustomAppBar(title: "Location", location: controller.location.value),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              autocorrect: false,
              controller: addProfileC.name,
              decoration: InputDecoration(
                labelText: "Nama",
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              autocorrect: false,
              controller: addProfileC.location,
              decoration: InputDecoration(
                labelText: "Location",
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Gender"),
            Obx(
              () => DropdownButton(
                  hint: Text("Select option"),
                  isExpanded: true,
                  value: Get.find<ProfileController>().gender.value,
                  items: const [
                    DropdownMenuItem(
                      value: "Laki-laki",
                      child: Text("Laki-laki"),
                    ),
                    DropdownMenuItem(
                      value: "Perempuan",
                      child: Text("Perempuan"),
                    ),
                  ],
                  onChanged: (new_value) {
                    Get.find<ProfileController>().gender.value =
                        new_value as String;
                  }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.editProfile(
                  addProfileC.name.text, addProfileC.location.text),
              child: Text("Edit Profile"),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 48)), // Menetapkan ukuran minimum
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green), // Warna background
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Warna teks
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Sudut membulat
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.green,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOME);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
