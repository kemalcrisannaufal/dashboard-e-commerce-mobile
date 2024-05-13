import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SubsectionTitleView extends GetView {
  final title;
  final Function()? onPressed;

  const SubsectionTitleView({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              "See all",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ))
      ],
    );
  }
}
