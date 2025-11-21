import 'package:api/models/data_model.dart';
import 'package:api/services/product_service.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxList<DataModel> allProduct = <DataModel>[].obs;
  RxBool isLoding = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  ///Get All Product
  Future<void> getProduct() async {
    isLoding.value = true;
    final data = await ProductService.fetchProducts();

    allProduct.value = data;
    Future.delayed(Duration(seconds: 1), () {
      isLoding.value = false;
    });
  }

  Future<void> deleteProduct(String pID) async {
    await ProductService.deleteProduct(pID);
    getProduct();
  }
}
