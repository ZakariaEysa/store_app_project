
import '../models/product_model.dart';

import '../helper/api.dart';

class GetAllProducts {
  GetAllProducts();

  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();

    return products;
  }
}
