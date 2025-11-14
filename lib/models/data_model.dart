class DataModel {
  final String? id;
  final String productName;
  final int productCode;
  final String img;
  final int qty;
  final int unitPrice;
  final int totalPrice;

  DataModel({
    this.id,
    required this.productName,
    required this.productCode,
    required this.img,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
  });
  // Product Model to Map{}
  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "ProductName": productName,
      "ProductCode": productCode,
      "Img": img,
      "Qty": qty,
      "UnitPrice": unitPrice,
      "TotalPrice": totalPrice,
    };
  }

  /// Map{} to model
  factory DataModel.fromMap(Map<String, dynamic> json) {
    return DataModel(
      productName: json["ProductName"],
      productCode: json["ProductCode"],
      img: json["Img"],
      qty: json["Qty"],
      unitPrice: json["UnitPrice"],
      totalPrice: json["TotalPrice"],
    );
  }
}
