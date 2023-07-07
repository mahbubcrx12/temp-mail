import 'package:assignment_asiatic/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool isObsecure;
  final TextStyle? labelStyle;

  CustomTextField(
      {required this.controller,
      this.hintText,
      this.labelText,
      this.validator,
      required this.isObsecure,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange),
        // Customize the border color here
        borderRadius:
            BorderRadius.circular(8.0), // Customize the border radius here
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        style: subtitleStyle.copyWith(color: Colors.white60),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: subtitleStyle,
          labelText: labelText,
          labelStyle: labelStyle,
        ),
        validator: validator,
      ),
    );
  }
}
