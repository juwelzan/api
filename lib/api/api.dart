class Apis {
  static final String url = "http://35.73.30.144:2008/api/v1";
  static final String getProduct = "$url/ReadProduct";
  static final String createProduct = "$url/CreateProduct";
  static String deleteProduct(String id) => "$url/DeleteProduct/$id";
}
