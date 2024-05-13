import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:my_tel_u_clone/app/modules/home/views/carrousel_card_view.dart';
import 'package:my_tel_u_clone/app/modules/home/views/subsection_title_view.dart';
import 'package:my_tel_u_clone/app/shared/widgets/appbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              SubsectionTitleView(title: "Category", onPressed: () {}),
              Container(
                height: 90,
                width: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.amber,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
