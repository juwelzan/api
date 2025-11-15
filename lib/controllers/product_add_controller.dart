import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> imgController = TextEditingController().obs;
  Rx<TextEditingController> qtyController = TextEditingController().obs;
  Rx<TextEditingController> unitController = TextEditingController().obs;
  Rx<TextEditingController> totalController = TextEditingController().obs;
}
