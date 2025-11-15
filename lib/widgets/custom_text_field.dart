import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool autofocus;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.autofocus,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      autofocus: autofocus,
      style: TextStyle(
        color: Color(0xffF9F5F0),
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        hintStyle: TextStyle(
          color: Color(0xffF9F5F0),
          fontWeight: FontWeight.bold,
        ),
        labelStyle: TextStyle(
          color: Color(0xffF9F5F0),
          fontWeight: FontWeight.bold,
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Color(0xff49FF00)),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffF9F5F0),
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
