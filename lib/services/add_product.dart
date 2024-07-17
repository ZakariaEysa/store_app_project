 import '../helper/api.dart';
import '../models/product_model.dart';

class AddProduct{



  AddProduct();

   Future <ProductModel> addProduct(ProductModel product) async{
 Map<String,dynamic> data = await  Api().post(url:"https://fakestoreapi.com/products",  product: product);

   return ProductModel.fromJson(data);

  }


 }