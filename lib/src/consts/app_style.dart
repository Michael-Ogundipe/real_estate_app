import 'package:flutter/material.dart';
import 'package:real_estate_app/src/consts/colors.dart';

class AppStyles {
  static TextStyle medium18 =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  static TextStyle font12Medium = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: whiteColor);

  static TextStyle font16Medium = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor);

  static TextStyle font16Regular =
      const TextStyle(color: Color(0xFFA5957E), fontSize: 16);
  static TextStyle font24Medium = const TextStyle(
      color: grayishBrownColor, fontSize: 24, fontWeight: FontWeight.w500);

  static TextStyle font32Bold = const TextStyle(
      color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);

  static TextStyle font36Regular =
      const TextStyle(fontSize: 36, fontWeight: FontWeight.w400, height: 1.2);
}
