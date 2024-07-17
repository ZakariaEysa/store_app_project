import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(ProductModel product) async {

    Map<String, dynamic> data = await Api().put(
      
        url: "https://fakestoreapi.com/products/${product.id}",
        product: product);

    return ProductModel.fromJson(data);
  }
}
