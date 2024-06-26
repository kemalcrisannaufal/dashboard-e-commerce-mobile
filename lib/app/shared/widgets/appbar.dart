import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tel_u_clone/app/routes/app_pages.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String location;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.green,
                ),
                Text(location,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )
          ],
        ),
      ),
      leadingWidth: 300,
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.PROFILE),
          child: Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/profile.jpg',
              ),
            ),
          ),
        )
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.notifications,
        //   ),
        // )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
