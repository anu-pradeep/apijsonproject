
import 'package:apijsonproject/simple%20api/model/model-class.dart';
import 'package:http/http.dart' as http;

class HttpService{

  static Future<List<ProductModel>> fetchProducts() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if(response.statusCode == 200){
      var data = response.body;
      return productModelFromJson(data);
    }else{
      throw Exception();
    }
  }
}