import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:my_tel_u_clone/app/modules/home/views/carrousel_card_view.dart';
import 'package:my_tel_u_clone/app/modules/home/views/category_menu_view.dart';
import 'package:my_tel_u_clone/app/modules/home/views/subsection_title_view.dart';
import 'package:my_tel_u_clone/app/shared/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return Scaffold(
        appBar:
            CustomAppBar(title: "Location", location: "Bandung, Jawa Barat"),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
            top: 5,
            bottom: 10,
          ),
          child: ListView(
            children: [
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
                            onTap: () {}),
                        SizedBox(
                          height: 10,
                        ),
                        CategoryMenuView(
                            title: categoryTitle[index + 5],
                            icon: iconCategory[index + 5],
                            onTap: () {})
                      ],
                    );
                  },
                ),
              ),
              SubsectionTitleView(title: "Diskon Hari Ini", onPressed: () {}),
              
            ],
          ),
        ));
  }
}
