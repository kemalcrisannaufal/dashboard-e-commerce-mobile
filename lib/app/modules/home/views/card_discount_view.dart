import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CardDiscountView extends GetView {
  final String image;
  final String title;
  final String price;
  final int cashback;

  const CardDiscountView({
    required this.image,
    required this.title,
    required this.price,
    required this.cashback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 180,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2),
                Text(
                  price,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 238, 121, 121),
                  ),
                  child: Text(
                    "Cashback " + cashback.toString() + " rb",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
