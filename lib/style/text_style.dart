import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle get titleStyle {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get subtitleStyle {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]);
}
