
import '../helper/api.dart';
import '../models/product_model.dart';

class GetCategory {
  GetCategory();

  Future<List<ProductModel>> getCategory(String category) async {
    List<dynamic> data =
        await Api().get( url: "https://fakestoreapi.com/products/category/$category");

    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();

    return products;
  }
}
