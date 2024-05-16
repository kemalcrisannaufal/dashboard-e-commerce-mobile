import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:my_tel_u_clone/app/modules/Profile/controllers/profile_controller.dart';
import 'package:my_tel_u_clone/app/modules/home/views/card_discount_view.dart';
import 'package:my_tel_u_clone/app/modules/home/views/carrousel_card_view.dart';
import 'package:my_tel_u_clone/app/modules/home/views/category_menu_view.dart';
import 'package:my_tel_u_clone/app/modules/home/views/subsection_title_view.dart';
import 'package:my_tel_u_clone/app/routes/app_pages.dart';
import 'package:my_tel_u_clone/app/shared/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../data/produk.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final categoryTitle = [
      "Promo Hari Ini",
      "Tiket",
      "Smartphone",
      "Makanan",
      "Olahraga",
      "Jam Tangan",
      "Sepatu",
      "Elektronik",
      "Kesehatan",
      "Lainnya",
    ];

    final iconCategory = [
      Icon(FontAwesomeIcons.tags, color: Colors.blue),
      Icon(FontAwesomeIcons.ticket, color: Colors.green),
      Icon(FontAwesomeIcons.mobile, color: Colors.grey),
      Icon(FontAwesomeIcons.utensils, color: Colors.orange),
      Icon(FontAwesomeIcons.football, color: Colors.brown),
      Icon(Icons.watch, color: Colors.black),
      Icon(FontAwesomeIcons.shoePrints, color: Colors.red),
      Icon(FontAwesomeIcons.laptop, color: Colors.purple),
      Icon(FontAwesomeIcons.heartPulse, color: Colors.pink),
      Icon(FontAwesomeIcons.ellipsis, color: Colors.grey),
    ];

    final profileC = Get.put(ProfileController());
    return Scaffold(
      appBar:
          CustomAppBar(title: "Location", location: profileC.location.value),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          top: 5,
          bottom: 10,
        ),
        child: ListView(
          children: [
            Obx(
              () => Text(
                textAlign: TextAlign.right,
                "Selamat pagi\n" + profileC.name.value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              items: [
                CarrouselCardView(),
                CarrouselCardView(),
                CarrouselCardView(),
              ],
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 10),
              ),
            ),
            SubsectionTitleView(title: "Kategori", onPressed: () {}),
            Container(
              height: 190,
              width: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (categoryTitle.length ~/ 2),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CategoryMenuView(
                          title: categoryTitle[index],
                          icon: iconCategory[index],
                          onTap: () {
                            Get.defaultDialog(
                              title: "Coming Soon",
                              content:
                                  Text("Fitur masih dalam tahap pengembangan"),
                            );
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CategoryMenuView(
                          title: categoryTitle[index + 5],
                          icon: iconCategory[index + 5],
                          onTap: () {
                            Get.defaultDialog(
                              title: "Coming Soon",
                              content:
                                  Text("Fitur masih dalam tahap pengembangan"),
                            );
                          })
                    ],
                  );
                },
              ),
            ),
            SubsectionTitleView(title: "Diskon Hari Ini", onPressed: () {}),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Produk.imagePath.length,
                itemBuilder: (context, index) {
                  return CardDiscountView(
                    image: Produk.imagePath[index],
                    title: Produk.productName[index],
                    price: Produk.price[index],
                    cashback: Produk.cashback[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.green,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.toNamed(Routes.PROFILE);
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
