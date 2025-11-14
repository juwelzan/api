import 'dart:convert';

import 'package:api/api/api.dart';
import 'package:api/models/data_model.dart';
import 'package:api/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  /// fetchProducts
  static Future<List<DataModel>> fetchProducts() async {
    try {
      final url = Uri.parse(Apis.getProduct);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        ProductModel productModel = ProductModel.fromMap(body);
        return productModel.data;
      } else {
        throw Exception("Failed to fetch products");
      }
    } catch (e) {
      throw Exception("Something Wrong");
    }
  }

  /// createProduct
  static Future<bool> createProduct(DataModel data) async {
    try {
      final url = Uri.parse(Apis.createProduct);
      final response = await http.post(
        url,
        headers: {"Content-Typev": "application/json"},
        body: jsonEncode({
          "ProductName": data.productName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Something Wrong");
    }
  }

  /// deletProduct
  Future<bool> deleteProduct(String productCode) async {
    try {
      final url = Uri.parse(Apis.deleteProduct(productCode));
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Something Wrong");
    }
  }

  /// update product
  static Future<bool> updateProduct(DataModel data, String id) async {
    try {
      final url = Uri.parse(Apis.updateProduct(id));
      final response = await http.post(
        url,
        headers: {"Content-Typev": "application/json"},
        body: jsonEncode({
          "ProductName": data.productName,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Something Wrong");
    }
  }
}
