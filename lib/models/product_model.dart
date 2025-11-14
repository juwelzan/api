import 'package:api/models/data_model.dart';

class ProductModel {
  final String status;
  final List<DataModel> data;
  ProductModel({required this.status, required this.data});
  // model to map{}
  Map<String, dynamic> toMap() {
    return {"status": status, "data": data};
  }

  //map{} to model
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(status: map["status"], data: map["data"]);
  }
}
