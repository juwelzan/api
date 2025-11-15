import 'package:api/controllers/controller.dart';
import 'package:api/models/data_model.dart';
import 'package:api/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final controller = Get.put<Controller>(Controller());

class ProductAddController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> imgController = TextEditingController().obs;
  Rx<TextEditingController> qtyController = TextEditingController().obs;
  Rx<TextEditingController> unitController = TextEditingController().obs;
  Rx<TextEditingController> totalController = TextEditingController().obs;
  late RxBool isNotEmpty =
      (nameController.value.text.isNotEmpty &&
              imgController.value.text.isNotEmpty &&
              qtyController.value.text.isNotEmpty &&
              unitController.value.text.isNotEmpty &&
              totalController.value.text.isNotEmpty)
          .obs;

  Future<void> add() async {
    if (isNotEmpty.value) {
      DataModel model = DataModel(
        productName: nameController.value.text,
        productCode: DateTime.now().microsecondsSinceEpoch,
        img: imgController.value.text,
        qty: int.parse(qtyController.value.text),
        unitPrice: int.parse(unitController.value.text),
        totalPrice: int.parse(totalController.value.text),
      );
      await ProductService.createProduct(model);
      controller.getProduct();
      nameController.value.text = "";
      imgController.value.text = "";
      qtyController.value.text = "";
      unitController.value.text = "";
      totalController.value.text = "";
    } else {}
  }
}
