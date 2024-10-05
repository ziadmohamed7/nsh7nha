import 'package:flutter/material.dart';
import 'package:nsh7nha/components/widgets/navigate_to.dart';

Widget Build_catigory(
    double halfScreenWidth, String image, Color shadowColor, context, widget) {
  return InkWell(
    onTap: () {
      Navigator_To(context, widget);
    },
    child: Container(
      width: halfScreenWidth,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          image, // Replace with your image URL or local asset
          fit: BoxFit.cover, // Adjust the image to fit the container
        ),
      ),
    ),
  );
}
