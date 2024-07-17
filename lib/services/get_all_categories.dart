
import '../helper/api.dart';

class GetAllCategories{



  GetAllCategories();

  getAllCategories( String category) async{
    List<dynamic> data=  await Api().get( url: "https://fakestoreapi.com/products/categories");




  }







}