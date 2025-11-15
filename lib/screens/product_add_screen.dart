import 'package:api/controllers/product_add_controller.dart';
import 'package:api/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductAddScreen extends StatelessWidget {
  ProductAddScreen({super.key});
  final controller = Get.put<ProductAddController>(ProductAddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050C9C),
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Color(0xff050C9C),
        titleTextStyle: TextStyle(
          color: Color(0xffF9F5F0),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          Gap(20.h),
          CustomTextField(
            hintText: 'Product Name',
            controller: controller.nameController.value,
            autofocus: true,
          ),
          Gap(20.h),
          CustomTextField(
            hintText: 'Image Link',
            controller: controller.imgController.value,
            autofocus: false,
            keyboardType: TextInputType.url,
          ),

          Gap(20.h),
          CustomTextField(
            hintText: 'Quantity',
            controller: controller.qtyController.value,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),

          Gap(20.h),
          CustomTextField(
            hintText: 'Unit Price',
            controller: controller.unitController.value,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),

          Gap(20.h),
          CustomTextField(
            hintText: 'Total Price',
            controller: controller.totalController.value,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),

          Gap(20.h),
          Center(
            child: SizedBox(
              width: 200.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff050C9C),
                  ),
                  backgroundColor: Color(0xffF9F5F0),
                  foregroundColor: Color(0xff050C9C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5.sp),
                  ),
                ),
                onPressed: () {},
                child: Text("Save"),
              ),
            ),
          ),
          Gap(50.h),
        ],
      ),
    );
  }
}
