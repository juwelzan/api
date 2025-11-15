// ignore_for_file: non_constant_identifier_names

import 'package:api/controllers/product_edit_controller.dart';
import 'package:api/models/data_model.dart';
import 'package:api/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final controller = Get.put<ProductEditController>(ProductEditController());
Widget ProductEditDialog(BuildContext context, DataModel model) {
  controller.nameController.value.text = model.productName;
  controller.imgController.value.text = model.img;
  controller.qtyController.value.text = model.qty.toString();
  controller.unitController.value.text = model.unitPrice.toString();
  controller.totalController.value.text = model.totalPrice.toString();
  return AlertDialog(
    backgroundColor: Color(0xff050C9C),
    titleTextStyle: TextStyle(
      color: Color(0xffF9F5F0),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    title: Text(textAlign: TextAlign.center, "Edit Product"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          autofocus: false,
          controller: controller.nameController.value,
          hintText: "Product Name",
        ),
        Gap(10.h),
        CustomTextField(
          autofocus: false,
          controller: controller.imgController.value,
          hintText: "Image Link",
        ),
        Gap(10.h),
        CustomTextField(
          autofocus: false,
          controller: controller.qtyController.value,
          hintText: "Quantity",
        ),
        Gap(10.h),
        CustomTextField(
          autofocus: false,
          controller: controller.unitController.value,
          hintText: "Unit Price",
        ),
        Gap(10.h),
        CustomTextField(
          autofocus: false,
          controller: controller.totalController.value,
          hintText: "Total Price",
        ),
        Gap(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.editProduct(model.id.toString());
                Navigator.pop(context);
              },
              child: Text("UpDate"),
            ),
          ],
        ),
      ],
    ),
  );
}
